class AddChannelToInstrument < ActiveRecord::Migration
  def self.up
    add_column :instruments, :channel, :string, :limit => 5
  end

  def self.down
    remove_column :instruments, :channel
  end
end
