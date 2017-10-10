class CreateTopicalizations < ActiveRecord::Migration[5.1]
  def change
    create_table :topicalizations do |t|
      t.references :post, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
