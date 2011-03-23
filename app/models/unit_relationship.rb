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
  
  validates :parent_unit_id, :presence => true
  validates :child_unit_id, :presence => true
end
