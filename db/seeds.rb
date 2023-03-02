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
  { tagname: "ミステリ" },
  { tagname: "アクション" },
  { tagname: "エッセイ" },
  { tagname: "ラブストーリー" },
  { tagname: "SF" }

  ])