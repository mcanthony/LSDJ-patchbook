class AddSampleToInstrument < ActiveRecord::Migration
  def self.up
    add_column :instruments, :sample, :string
  end

  def self.down
    remove_column :instruments, :sample
  end
end
