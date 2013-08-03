class AddPasswordToUsrs < ActiveRecord::Migration
  def self.up
    add_column :usrs, :encrypted_password, :string
  end

  def self.down
    remove_column :usrs, :encrypted_password
  end
end
