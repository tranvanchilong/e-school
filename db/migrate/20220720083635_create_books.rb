class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :genre
      t.text :describe

      t.timestamps
    end
  end
end
