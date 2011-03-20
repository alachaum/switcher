class CreateUnitRelationships < ActiveRecord::Migration
  def self.up
    create_table :unit_relationships do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end

  def self.down
    drop_table :unit_relationships
  end
end
