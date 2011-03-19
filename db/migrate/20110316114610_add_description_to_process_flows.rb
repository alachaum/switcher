class AddDescriptionToProcessFlows < ActiveRecord::Migration
  def self.up
    add_column :process_flows, :description, :text
  end

  def self.down
    remove_column :process_flows, :description
  end
end
