class MakeCommentsAJoinTable < ActiveRecord::Migration[5.1]
  
  def up
    Comment.delete_all
    remove_column :comments, :name
    remove_column :comments, :email
    add_column :comments, :user_id, :integer
  end

  def down
    Comment.delete_all
    remove_column :comments, :user_id
    add_column :comments, :name, :string
    add_column :comments, :email, :string
  end

end
