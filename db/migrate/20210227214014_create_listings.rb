class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :price
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
