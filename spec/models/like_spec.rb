require 'rails_helper'

describe Like, type: :model do
  it '#update_post_likes_counter' do
    author = User.create!(name: 'test')
    post = Post.create!(title: 'first post', author: author)
    Like.create!(post: post, author: author)
    expect(post.likes_counter).to eq(1)
  end
end
