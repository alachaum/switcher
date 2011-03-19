# == Schema Information
# Schema version: 20110316114610
#
# Table name: process_flows
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class ProcessFlow < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :process_units, :dependent => :destroy
  
  validates :name, :presence => true
  
end
