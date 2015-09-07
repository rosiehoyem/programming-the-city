class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :website_url
      t.string :image_url
      t.text :description

      t.timestamps null: false
    end
  end
end
