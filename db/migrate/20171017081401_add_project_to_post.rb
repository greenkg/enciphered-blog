class AddProjectToPost < ActiveRecord::Migration[5.1]
  def up
    add_column :posts, :project_id, :integer
  end

  def down
    remove_column :posts, :project_id
  end
end
