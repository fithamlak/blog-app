require 'rails_helper'

describe 'Post index page', type: :system do
  describe 'Integration test to checks the content of the posts#index page' do
    before(:each) do
      @user1 = User.create(name: 'Justice', photo: 'https://robohash.org/idquiet.png', bio: 'developer')
      @user2 = User.create(name: 'Solomon', photo: 'https://robohash.org/idquiet.png', bio: 'coder')
      @post1 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @post2 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @post3 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @post4 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @comment1 = Comment.create!(text: Faker::Quotes::Shakespeare.as_you_like_it_quote, author: @user1, post: @post1)
      @comment2 = Comment.create!(text: Faker::Quotes::Shakespeare.as_you_like_it_quote, author: @user2, post: @post1)
      @like1 = Like.create!(author: @user2, post: @post1)
    end

    it "I can see the user's profile picture." do
      visit user_posts_path(@user1)

      expect(page).to have_css("img[src*='#{@user1.photo}']")
    end

    it "I can see the user's username." do
      visit user_posts_path(@user1)

      expect(page).to have_content(@user1.name)
    end

    it 'I can see the number of posts the user has written.' do
      visit user_posts_path(@user1)

      expect(page).to have_content("Number of posts: #{@user1.posts.size}")
    end

    it "I can see a post's title." do
      visit user_posts_path(@user1)

      expect(page).to have_content(@post1.title)
    end

    it "I can see some of the post's body." do
      visit user_posts_path(@user1)

      expect(page).to have_content(@post1.text)
    end

    it 'I can see the first comments on a post.' do
      visit user_posts_path(@user1)

      expect(page).to have_content(@comment1.text)
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(@user1)

      expect(page).to have_content("Comments #{@post1.comments.size}")
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(@user1)

      expect(page).to have_content("Likes #{@post1.likes.size}")
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(@user1)

      expect(page).to have_content('Pagination')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      visit user_posts_path(@user1)

      click_link @post1.title
      expect(page).to have_current_path(post_path(@post1))
    end
  end
end