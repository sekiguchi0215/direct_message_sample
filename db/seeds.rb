# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

user1 = User.create!(email: "test1@example.com", password: password)
user2 = User.create!(email: "test2@example.com", password: password)
user3 = User.create!(email: "test3@example.com", password: password)
user4 = User.create!(email: "test4@example.com", password: password)
puts "ユーザーの初期データインポートに成功しました。"

user1.posts.create!(content: "Javascript", status: "public")
user1.posts.create!(content: "PHP", status: "public")
user1.posts.create!(content: "Ruby on Rails", status: "private")
user2.posts.create!(content: "ラーメン", status: "public")
user2.posts.create!(content: "カツ丼", status: "private")
user2.posts.create!(content: "きなこもち", status: "private")
user3.posts.create!(content: "ドラクエ", status: "public")
user3.posts.create!(content: "ポケモン", status: "private")
user3.posts.create!(content: "逆転裁判", status: "public")
user4.posts.create!(content: "半沢", status: "private")
user4.posts.create!(content: "大和田", status: "private")
user4.posts.create!(content: "伊佐山", status: "private")
puts "投稿の初期データインポートに成功しました。"

room1 = Room.create
room2 = Room.create
room3 = Room.create
room4 = Room.create
room5 = Room.create
puts "ルームの初期データインポートに成功しました。"

Entry.create(room_id: room1.id, user_id: user1.id)
Entry.create(room_id: room1.id, user_id: user2.id)

Entry.create(room_id: room2.id, user_id: user1.id)
Entry.create(room_id: room2.id, user_id: user3.id)

Entry.create(room_id: room3.id, user_id: user2.id)
Entry.create(room_id: room3.id, user_id: user3.id)

Entry.create(room_id: room4.id, user_id: user2.id)
Entry.create(room_id: room4.id, user_id: user4.id)

Entry.create(room_id: room5.id, user_id: user1.id)
Entry.create(room_id: room5.id, user_id: user4.id)
puts "Entryモデルの初期データインポートに成功しました。"

group1 = Group.create!(name: "group1")
group2 = Group.create!(name: "group2")
group3 = Group.create!(name: "group3")
puts "グループの初期データインポートに成功しました。"

GroupUser.create(group_id: group1.id, user_id: user1.id)
GroupUser.create(group_id: group1.id, user_id: user2.id)
GroupUser.create(group_id: group1.id, user_id: user3.id)
GroupUser.create(group_id: group2.id, user_id: user1.id)
GroupUser.create(group_id: group2.id, user_id: user3.id)
GroupUser.create(group_id: group2.id, user_id: user4.id)
GroupUser.create(group_id: group3.id, user_id: user2.id)
GroupUser.create(group_id: group3.id, user_id: user3.id)
GroupUser.create(group_id: group3.id, user_id: user4.id)
puts "GroupUserモデルの初期データインポートに成功しました。"
