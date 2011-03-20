class AddFunctionParametersToProcessElements < ActiveRecord::Migration
  def self.up
    add_column :process_elements, :function_parameters, :string
  end

  def self.down
    remove_column :process_elements, :function_parameters
  end
end
