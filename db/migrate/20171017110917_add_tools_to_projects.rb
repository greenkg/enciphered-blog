class AddToolsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :tools, :string
  end
end
