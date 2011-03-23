class AddParentChildUnitIdColumnsToUnitReleationships < ActiveRecord::Migration
  def self.up
    add_column :unit_relationships, :parent_unit_id, :integer
    add_column :unit_relationships, :child_unit_id, :integer
  end

  def self.down
    remove_column :unit_relationships, :parent_unit_id, :integer
    remove_column :unit_relationships, :child_unit_id, :integer
  end
end
