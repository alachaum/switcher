class RemoveColumnFromProcessElements < ActiveRecord::Migration
  def self.up
    remove_column :process_elements, :type
  end

  def self.down
    add_column :process_elements, :type, :string
  end
end
