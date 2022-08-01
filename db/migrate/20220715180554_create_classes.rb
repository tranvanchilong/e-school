class CreateClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :classes do |t|
      t.string :name
      t.string :subject
      t.text :description
      t.integer :teacher

      t.timestamps
    end
  end
end
