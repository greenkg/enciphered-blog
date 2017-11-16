class AddSlugToPosts < ActiveRecord::Migration[5.1]
  def up
    add_column :posts, :slug, :string
  end

  def down
    remove_column :posts, :slug
  end
end
