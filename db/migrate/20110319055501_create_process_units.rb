class CreateProcessUnits < ActiveRecord::Migration
  def self.up
    create_table :process_units do |t|
      t.string :name
      t.text :description
      t.integer :process_flow_id

      t.timestamps
    end
    add_index :process_units, :process_flow_id
  end

  def self.down
    drop_table :process_units
  end
end
