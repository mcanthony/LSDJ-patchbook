class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      # login => User login
      t.string    "login", :null => false
      t.string    "crypted_password", :null => false
      t.string    "password_salt", :null => false
      # persistence_token => required | User internally in Authlogic for
      # cookie and session
      t.string    "persistence_token", :null => false
      # See Authlogic::Session::Perishability
      # For password reset
      t.string    "perishable_token", :default => "", :null => false
      # See Authlogic::Session::Params
      # For ?user_credentials=[single access token]
      # For scripts, feeds etc.
      t.string    "single_access_token"

      t.string    "firstname"
      t.string    "lastname"
      t.string    "email"

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
