# creat users
5.times do
  user = User.new(
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: Faker::Lorem.characters(10)
                  )
  user.skip_confirmation!
  user.save!
end

users = User.all


# create topics
15.times do
  Topic.create(
               name: Faker::Lorem.sentence,
               description: Faker::Lorem.paragraph
               )
end
topics = Topic.all



# create posts
  50.times do
  post = Post.create(
              user: users.sample,
              topic: topics.sample,
              title: Faker::Lorem.sentence,
              body: Faker::Lorem.paragraph
              )
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.create_vote
  post.update_rank
  end

posts = Post.all

# create comments
100.times do
  Comment.create(
                 post: posts.sample,
                 user: users.sample,
                 body: Faker::Lorem.paragraph
                 )
  end

# create admin
admin = User.new(
                 name: 'Admin User',
                 email: 'admin@example.com',
                 password: 'helloworld',
                 role: 'admin'
                 )
admin.skip_confirmation!
admin.save!

# create moderator
moderator = User.new(
                 name: 'Moderator User',
                 email: 'moderator@example.com',
                 password: 'helloworld',
                 role: 'moderator'
                 )
moderator.skip_confirmation!
moderator.save!

# create member
member = User.new(
                 name: 'Member User',
                 email: 'member@example.com',
                 password: 'helloworld',
                 )
member.skip_confirmation!
member.save!

