class AddRepoLinkToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :repo_link, :string
  end
end
