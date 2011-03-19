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

  validates :name, :presence => true
  validates :process_flow_id, :presence => true
end
