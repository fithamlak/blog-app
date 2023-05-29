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
  end
end