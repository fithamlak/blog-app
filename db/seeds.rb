User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

user1 = User.create!(
  email: 'ordinaluser1@test.com',
  password: 'password1',
  password_confirmation: 'password1',
  confirmed_at: Time.now,
  name: Faker::Name.first_name,
  photo: Faker::Avatar.image,
  bio: Faker::Job.title
)
post1 = Post.create!(
  title: Faker::Quotes::Shakespeare.hamlet_quote,
  text: Faker::Quote.matz,
  author: user1
)

comment1 = Comment.create!(
  text: Faker::Quote.matz,
  post: post1,
  author: user1
)
comment2 = Comment.create!(
  text: Faker::Quote.matz,
  post: post1,
  author: user1
)
post2 = Post.create!(
  title: Faker::Quotes::Shakespeare.hamlet_quote,
  text: Faker::Quote.matz,
  author: user1
)
user2 = User.create!(
  email: 'adminuser@test.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now,
  name: Faker::Name.first_name,
  photo: Faker::Avatar.image,
  bio: Faker::Job.title,
  role: 'admin'
)
post3 = Post.create!(
  title: Faker::Quotes::Shakespeare.hamlet_quote,
  text: Faker::Quote.matz,
  author: user2
)
comment3 = Comment.create!(
  text: Faker::Quote.matz,
  post: post1,
  author: user2
)