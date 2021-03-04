class RemoveCaterogyFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :listings, :category, null: false, foreign_key: true
  end
end
