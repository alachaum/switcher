# == Schema Information
# Schema version: 20110323114522
#
# Table name: unit_relationships
#
#  id             :integer         not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  parent_unit_id :integer
#  child_unit_id  :integer
#

class UnitRelationship < ActiveRecord::Base
  attr_accessible :parent_unit_id, :child_unit_id
  
  belongs_to :parent_unit, :class_name => "ProcessUnit"
  belongs_to :child_unit, :class_name => "ProcessUnit"
  
  validates :parent_unit_id, :presence => true
  validates :child_unit_id, :presence => true
  validates_uniqueness_of :parent_unit_id, :scope => :child_unit_id #make sure a relationship is unique
  validate :no_self_relationship, :no_loop_relationship
  
  
  private
    def no_self_relationship
      if parent_unit_id == child_unit_id
        errors.add(:child_unit_id, ": a unit cannot be linked to itself")
      end
    end
    
    def no_loop_relationship
      reverse_relation = UnitRelationship.where(:parent_unit_id => child_unit_id, 
                                                :child_unit_id => parent_unit_id).first
      if reverse_relation
        errors.add(:child_unit_id, ": loops are not allowed")
      end
    end
end
