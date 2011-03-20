class AddFunctionDefinitionToProcessElements < ActiveRecord::Migration
  def self.up
    add_column :process_elements, :function_name, :string
    add_column :process_elements, :parameters_list, :string
  end

  def self.down
    remove_column :process_elements, :parameters_list
    remove_column :process_elements, :function_name
  end
end
