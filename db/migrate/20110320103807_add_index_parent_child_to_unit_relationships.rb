class AddIndexParentChildToUnitRelationships < ActiveRecord::Migration
  def self.up
    add_index :unit_relationships, :parent_id
    add_index :unit_relationships, :child_id
  end

  def self.down
    remove_index :unit_relationships, :parent_id
    remove_index :unit_relationships, :child_id 
  end
end
