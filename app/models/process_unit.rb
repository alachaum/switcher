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
  attr_accessible :name, :description

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
  
  #parent-child methods
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
end
