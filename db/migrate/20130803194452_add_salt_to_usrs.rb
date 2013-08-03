class AddSaltToUsrs < ActiveRecord::Migration
  def self.up
    add_column :usrs, :salt, :string
  end

  def self.down
    remove_column :usrs, :salt
  end
end
