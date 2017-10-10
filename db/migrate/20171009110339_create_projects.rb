class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
      t.boolean :finished
      t.string :image_file_name

      t.timestamps
    end
  end
end
