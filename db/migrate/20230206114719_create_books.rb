class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      #追加したカラム
      t.string :title
      t.string :author
      t.biginit :isbn, null: false
      t.text :book_url
      t.text :book_image_url

      t.timestamps
    end
  end
end
