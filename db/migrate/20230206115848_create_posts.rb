class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      #追加したカラム
      t.text :comment
      t.string :readingtime
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
