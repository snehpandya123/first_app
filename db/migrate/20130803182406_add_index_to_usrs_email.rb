class AddIndexToUsrsEmail < ActiveRecord::Migration
  def self.up
  	add_index :usrs, :email, :unique => true
  end

  def self.down
  	remove_index :usrs, :email
  end
end
