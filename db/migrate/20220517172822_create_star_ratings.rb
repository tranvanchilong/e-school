class CreateStarRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :star_ratings do |t|
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
