# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "ayumisasaki1124@gmail.com", password: "ayumi1124")

Tag.create([
  { tagname: "コメディ" },
  { tagname: "ミステリー" },
  { tagname: "ファンタジー" },
  { tagname: "アクション" },
  { tagname: "恋愛" },
  { tagname: "SF" },
  { tagname: "歴史小説" },
  { tagname: "エッセイ" },
  { tagname: "ノンフィクション" },
  { tagname: "自己啓発" },
  { tagname: "ビジネス" },
  { tagname: "専門書" },
  { tagname: "児童書" },
  { tagname: "その他" }

  ])