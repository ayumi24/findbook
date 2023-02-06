class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

      #追加したカラム
      t.string :tagname

      t.timestamps
    end
  end
end
