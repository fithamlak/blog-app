require 'rails_helper'

describe User, type: :model do
  it 'name is required' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid if posts_counter is not an integer greater than or equal to zero' do
    user = User.new(posts_counter: -1)
    expect(user).to_not be_valid
  end

  it 'is valid if posts_counter is an integer greater than or equal to zero' do
    user = User.new(name: 'test', posts_counter: 0)
    expect(user).to be_valid
  end

  it '#last_three_posts' do
    user = User.create!(name: 'test', posts_counter: 0)
    Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author: user)
    Post.create!(title: 'second post', comments_counter: 1, likes_counter: 1, author: user)
    Post.create!(title: 'third post', comments_counter: 1, likes_counter: 1, author: user)
    Post.create!(title: 'fourth post', comments_counter: 1, likes_counter: 1, author: user)
    posts = user.last_three_posts
    expect(posts.size).to eq(3)
  end
end
