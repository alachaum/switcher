class RemoveParentChildIdColumnsFromUnitReleationships < ActiveRecord::Migration
  def self.up
    remove_column :unit_relationships, :parent_id
    remove_column :unit_relationships, :child_id
  end

  def self.down
    add_column :unit_relationships, :parent_id, :integer
    add_column :unit_relationships, :child_id, :integer
  end
end
