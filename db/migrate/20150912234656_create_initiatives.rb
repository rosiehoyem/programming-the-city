class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :name
      t.string :organizer
      t.string :website_url
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
