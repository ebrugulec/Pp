AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

users = User.create(
                  [{
                    full_name: 'ebru güleç', email: "ebru@gmail.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    full_name: 'ali kahraman', email: "ali@hotmail.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    full_name: 'ayşe yüce', email: "ayse@ayse.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    full_name: 'aylin ay', email: "aylin@aylin.com", password: "123456", password_confirmation: "123456"
                  },
                  {
                    full_name: 'veli bey', email: "veli@veli.com", password: "123456", password_confirmation: "123456"
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
