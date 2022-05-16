class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
