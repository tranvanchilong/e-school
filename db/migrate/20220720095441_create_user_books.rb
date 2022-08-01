class CreateUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :borrowed_date
      t.integer :appointment
      t.datetime :return_date
      t.integer :total_borrowings

      t.timestamps
    end
  end
end
