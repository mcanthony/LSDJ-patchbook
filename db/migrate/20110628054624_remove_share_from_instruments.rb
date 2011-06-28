class RemoveShareFromInstruments < ActiveRecord::Migration
  def self.up
    remove_column :instruments, :share
  end

  def self.down
    add_column :instruments, :share, :boolean, :null => false, :default => 1
  end
end
