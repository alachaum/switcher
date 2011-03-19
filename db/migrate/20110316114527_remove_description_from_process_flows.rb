class RemoveDescriptionFromProcessFlows < ActiveRecord::Migration
  def self.up
    remove_column :process_flows, :description
  end

  def self.down
    add_column :process_flows, :description, :string
  end
end
