require 'rails_helper'

describe 'Users show page', type: :system do
  describe 'checks the content of the users#show page' do
    before(:each) do
      @user1 = User.create(name: 'Justice', photo: 'https://robohash.org/idquiet.png', bio: 'Engineer')
      @post1 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @post2 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @post3 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
      @post4 = Post.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, text: Faker::Quote.matz, author: @user1)
    end

    it "I can see the user's profile picture." do
      visit user_path(@user1)

      expect(page).to have_css("img[src*='#{@user1.photo}']")
    end

    it "I can see the user's username." do
      visit user_path(@user1)

      expect(page).to have_content(@user1.name)
    end

    it 'I can see the number of posts the user has written' do
      visit user_path(@user1)

      expect(page).to have_content("Number of posts: #{@user1.posts.size}")
    end

    it "I can see the user's bio." do
      visit user_path(@user1)
      expect(page).to have_content(@user1.bio)
    end
    it "I can see the user's first 3 posts." do
      visit user_path(@user1)
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end
    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(@user1)
      expect(page).to have_link('See all posts', class: 'btn')
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      visit user_path(@user1)
      click_link @post2.title
      expect(page).to have_current_path(post_path(@post2))
    end
    it "When I click to see all posts, it redirects me to the user's post's index page." do
      visit user_path(@user1)
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user1))
    end
  end
end
