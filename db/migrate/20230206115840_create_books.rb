class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :item_url
      t.string :book_image_url

      t.timestamps
    end
  end
end
