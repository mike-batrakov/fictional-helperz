class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating, default: 1
      # t.references :booking, null: false, foreign_key: true
    end
  end
end
