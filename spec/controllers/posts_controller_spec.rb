require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end

  context "ログインユーザー" do
    it "index,正常なレスポンスか" do
      sign_in @user
      get :index
      expect(response).to be_successful
    end

    it "index,200レスポンスが返ってきているか" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end

    it "new,正常なレスポンスか" do
      sign_in @user
      get :new
      expect(response).to be_successful
    end

    it "new,200レスポンスが返ってきているか" do
      sign_in @user
      get :new
      expect(response).to have_http_status "200"
    end

    it "show,正常なレスポンスか" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to be_successful
    end

    it "show,200レスポンスか返ってきているか" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
  end

  context "未ログインユーザー" do
    it "index,正常なレスポンスが返ってこないか" do
      get :index
      expect(response).to_not be_successful
    end

    it "index,302レスポンスが返ってきているか" do
      get :index
      expect(response).to have_http_status "302"
    end

    it "new,正常なレスポンスが返ってこないか" do
      get :new
      expect(response).to_not be_successful
    end

    it "new,302レスポンスが返ってきているか" do
      get :new
      expect(response).to have_http_status "302"
    end

    it "show,正常なレスポンスが返ってこないか" do
      get :show, params: {id: @post.id}
      expect(response).to_not be_successful
    end

    it "show,302レスポンスが返ってきているか" do
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "302"
    end
  end
end
