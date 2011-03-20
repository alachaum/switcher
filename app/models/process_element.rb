# == Schema Information
# Schema version: 20110320022845
#
# Table name: process_elements
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  description     :text
#  type            :string(255)
#  process_unit_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ProcessElement < ActiveRecord::Base
  attr_accessible :name, :description, :role
  
  belongs_to :process_unit
  
  validates :name, :presence => true
  validates :role, :presence => true
  validates :process_unit_id, :presence => true
end
