class AddUserIdToInstruments < ActiveRecord::Migration
  def self.up
    add_column :instruments, :user_id, :integer
  end

  def self.down
    remove_column :instruments, :user_id
  end
end
