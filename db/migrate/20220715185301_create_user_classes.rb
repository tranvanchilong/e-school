class CreateUserClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_classes do |t|
      t.references :user, foreign_key: true
      t.references :classe, foreign_key: true

      t.timestamps
    end
  end
end
