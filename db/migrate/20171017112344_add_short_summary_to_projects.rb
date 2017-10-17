class AddShortSummaryToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :short_summary, :string
  end
end
