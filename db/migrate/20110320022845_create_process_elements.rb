class CreateProcessElements < ActiveRecord::Migration
  def self.up
    create_table :process_elements do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :process_unit_id

      t.timestamps
    end
    add_index :process_elements, :process_unit_id
  end

  def self.down
    drop_table :process_elements
  end
end
