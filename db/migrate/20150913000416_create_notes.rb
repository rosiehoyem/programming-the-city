class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.string :image
      t.string :parent_id
      t.string :parent_type
      t.references :initiative
      t.references :person
      t.references :medium
      t.references :concept
      t.references :company

      t.timestamps null: false
    end
  end
end
