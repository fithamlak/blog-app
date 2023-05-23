require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'John', posts_counter: 0) }

  describe 'GET /index' do
    it 'response status is success' do
      get user_posts_path(user)
      expect(response.status).to eq(200)
    end
    it 'index template was rendered' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
    it "response body includes the text 'List of posts'" do
      get user_posts_path(user)
      expect(response.body).to include('List of posts')
    end
  end
end  