# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
    user = User.create!(
      email: "dummy#{i + 1}@example.com",
      username: "dummy_user#{i + 1}",
      password: "password", # パスワードを設定
      password_confirmation: "password", # パスワード確認を設定
    )
  
    Article.create!(
      content: "This is a dummy article created by user#{i + 1}.",
      user: user
    )
  end
  