class AddColumnToProcessElements < ActiveRecord::Migration
  def self.up
    add_column :process_elements, :role, :string
  end

  def self.down
    remove_column :process_elements, :role
  end
end
