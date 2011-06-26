class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instruments do |t|
      t.string :type, :null => false
      t.string :author, :null => true

      t.string :name, :null => true, :limit => 5
      t.string :envelope, :null => false, :default => "A8", :limit => 2
      t.string :wave, :null => false, :default => 50 # 12.5 25 50 75
      t.string :output, :null => false, :default => "LR", :limit => 2 # LR L R
      t.string :length, :null => false, :default => "UNLIM", :limit => 5
      t.string :sweep, :null => false, :default => "FF", :limit => 2
      t.string :vib_type, :null => false, :default => "HF", :limit => 3 # HF SIN TRI SQR
      t.string :pu2_tune, :null => false, :default => 00, :limit => 2
      t.string :pu_fine, :null => false, :default => 0, :limit => 1
      t.string :automate, :null => false, :default => "OFF", :limit => 3 # ON OFF
      t.string :table, :null => false, :default => "OFF", :limit => 3 # ON OFF

      # Table, 14 rows
      t.string :table_content, :null => true # a JSON encoded content of the Table

      t.timestamps
    end
  end

  def self.down
    drop_table :instruments
  end
end
