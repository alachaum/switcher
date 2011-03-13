# == Schema Information
# Schema version: 20110313091239
#
# Table name: process_flows
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ProcessFlow < ActiveRecord::Base
end
