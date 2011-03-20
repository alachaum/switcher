class RemoveParametersListFromProcessElements < ActiveRecord::Migration
  def self.up
    remove_column :process_elements, :parameters_list
  end

  def self.down
    add_column :process_elements, :parameters_list, :string
  end
end
