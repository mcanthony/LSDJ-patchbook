class CreateTableRows < ActiveRecord::Migration
  def self.up
    create_table :table_rows do |t|
      t.string :row, :limit => 1

      t.string :vol, :default => "00", :limit => 2
      t.string :tsp, :default => "00", :limit => 2
      t.string :cmd1,:default => "-00",:limit => 3
      t.string :cmd2,:default => "-00",:limit => 3

      t.integer :instrument_id

      t.timestamps
    end
  end

  def self.down
    drop_table :table_rows
  end
end
