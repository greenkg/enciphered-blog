class AddUsernameAdminLikesToGuest < ActiveRecord::Migration[5.1]
  def up
    add_column :guests, :username, :string
    add_column :guests, :admin, :boolean, default: false
  end

  def down
    remove_column :guests, :username
    remove_column :guests, :admin
  end
end
