class AddIndexToParentChildUnitIdToUnitRelationships < ActiveRecord::Migration
  def self.up
    add_index :unit_relationships, :parent_unit_id
    add_index :unit_relationships, :child_unit_id
  end

  def self.down
    remove_index :unit_relationships, :parent_unit_id
    remove_index :unit_relationships, :child_unit_id
  end
end
