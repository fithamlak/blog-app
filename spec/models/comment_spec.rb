require 'rails_helper'

describe Comment, type: :model do
  it '#update_post_comments_counter' do
    author = User.create!(name: 'test')
    post = Post.create!(title: 'first post', author: author)
    Comment.create!(text: 'test', post: post, author: author)
    expect(post.comments_counter).to eq(1)
  end
end
