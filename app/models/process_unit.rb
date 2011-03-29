# == Schema Information
# Schema version: 20110319055501
#
# Table name: process_units
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  description     :text
#  process_flow_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ProcessUnit < ActiveRecord::Base
  attr_accessible :name, :description, :process_flow_id #TODO remove this last one

  belongs_to :process_flow
  has_many :process_elements, :dependent => :destroy
  
  #child relationships
  has_many :unit_relationships, :foreign_key => "parent_unit_id",
                                :dependent => :destroy
  has_many :child_units, :through => :unit_relationships
  
  #parent relationships
  has_many :unit_reverse_relationships, :foreign_key => "child_unit_id",
                                        :class_name => "UnitRelationship",
                                        :dependent => :destroy
  has_many :parent_units, :through => :unit_reverse_relationships

  validates :name, :presence => true
  validates :process_flow_id, :presence => true
  
  #PARENT-CHILD METHODS
  def parent_of(child_unit)
    self.unit_relationships.create(:child_unit_id => child_unit.id)
  end
  
  def parent_of?(child_unit)
    self.unit_relationships.find_by_child_unit_id(child_unit)
  end
  
  def child_of(parent_unit)
    self.unit_reverse_relationships.create(:parent_unit_id => parent_unit.id)
  end
  
  def child_of?(parent_unit)
    self.unit_reverse_relationships.find_by_parent_unit_id(parent_unit)
  end
  
  def linked_to?(other_unit)
    self.parent_of(other_unit) || self.child_of(other_unit)
  end
  
  #UNIT TREE CONSTRUCTION
  #Find the children of a list of Process Flows/Units
  def self.find_children_of(*list)
    result = []
    p_flow_ids = []
    p_unit_ids = []
    list.each do |object|
      if object.class == ProcessFlow
        p_flow_ids << object.id
      elsif object.class == ProcessUnit
        p_unit_ids << object.id
      end
    end
    unless p_flow_ids.empty?
      result +=  ProcessUnit.where("process_flow_id IN(#{p_flow_ids.join(",")}) AND id NOT IN(SELECT child_unit_id FROM unit_relationships)")
    end
    unless p_unit_ids.empty?
      result += ProcessUnit.where("id IN(SELECT child_unit_id FROM unit_relationships WHERE parent_unit_id IN(#{p_unit_ids.join(",")}))")
    end
    return result
  end
  
  #build the unit tree
  def self.build_unit_tree(process_flow)
    unit_tree = []
    children = process_flow
    while !(children = ProcessUnit.find_children_of(*children)).empty?
      unit_tree << children
      #Remove any instance of children elements in lower levels
      (unit_tree.size-1).times do |n|
        children.each do |unit|
          unit_tree[n].delete(unit)
        end
      end
    end
    return unit_tree
  end
end
