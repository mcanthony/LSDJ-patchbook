class AddInstrumentNameToInstruments < ActiveRecord::Migration
  def self.up
    add_column :instruments, :instrument_name, :string, :limit => 5
  end

  def self.down
    remove_column :instruments, :instrument_name
  end
end
