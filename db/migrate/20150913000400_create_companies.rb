class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :website_url

      t.timestamps null: false
    end
  end
end
