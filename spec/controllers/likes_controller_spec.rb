require 'rails_helper'

RSpec.describe "Like", type: :controller do
  before do
    before do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      @like = FactoryBot.build(:like, user_id: user.id, post_id: post.id)
    end
  end

  describe "POST #create" do
    before do
      sign_in @user
    end

    it "responds with JSON formatted output" do
      post :create, format: :js,
      params: { post_id: post.id, id: like.id }
      expect(response.content_type).to eq "application/json"
    end

    it "add a new like to the tweet" do
      expect { post :create, format: :json, params: { post_id: post.id, id: like.id } }.to change{ Like.count }.by(1)
    end

    it "保存できる" do
      expect(@like).to be_valid
    end
  end
end
