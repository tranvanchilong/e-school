class CreatePostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_comments do |t|
      t.references :user, foreign_key: true
      t.references :micropost, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
