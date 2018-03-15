# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

users = User.create(
                  [{
                    username: 'ebru', email: "ebru@gmail.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    username: 'ali', email: "ali@hotmail.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    username: 'ayşe', email: "ayse@ayse.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    username: 'aylin', email: "aylin@aylin.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    username: 'veli', email: "veli@veli.com", password: "123456", password_confirmation: "123456"
                  }
                ]
              )

Chatroom.create(
              [{
                  name: "Genel"
                },
                {
                  name: "Duyurular"
                },
                {
                  name: "Özel Kon"
                },
                {
                  name: "Paralel Prog"
                }
              ]
            )

users.each do |u|
  Chatroom.first.chatroom_users.create(user_id: u.id, last_read_at: Time.now())
  Chatroom.second.chatroom_users.create(user_id: u.id, last_read_at: Time.now())
end
