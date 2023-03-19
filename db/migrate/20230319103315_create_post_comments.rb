class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :post_id
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
