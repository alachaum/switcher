# == Schema Information
# Schema version: 20110320065006
#
# Table name: process_elements
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  description         :text
#  process_unit_id     :integer
#  created_at          :datetime
#  updated_at          :datetime
#  role                :string(255)
#  function_name       :string(255)
#  function_parameters :string(255)
#

class ProcessElement < ActiveRecord::Base
  attr_accessible :name, :description, :role, :function_name, :function_parameters
  
  belongs_to :process_unit
  
  validates :name, :presence => true
  validates :role, :presence => true
  validates :process_unit_id, :presence => true
end
