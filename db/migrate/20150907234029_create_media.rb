class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :type
      t.string :url
      t.text :description
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
