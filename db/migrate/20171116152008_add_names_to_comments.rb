class AddNamesToComments < ActiveRecord::Migration[5.1]
  def up
    add_column :comments, :name, :string
  end

  def down
    remove_column :comments, :name
  end
end
