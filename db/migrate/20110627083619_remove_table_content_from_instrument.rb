class RemoveTableContentFromInstrument < ActiveRecord::Migration
  def self.up
    remove_column :instruments, :table_content
  end

  def self.down
    add_column :instruments, :table_content, :string
  end
end
