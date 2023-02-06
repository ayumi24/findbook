class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      #追加したカラム
      t.text :comment
      t.string :readingtime

      t.timestamps
    end
  end
end
