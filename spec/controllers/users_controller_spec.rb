require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  context "ログインユーザー" do
    it "正常なレスポンスか" do
      sign_in @user
      get :show, params: {id: @user.id}
      expect(response).to be_successful
    end

    it "200レスポンス返ってきているか" do
      sign_in @user
      get :show, params: {id: @user.id}
      expect(response).to have_http_status "200"
    end
  end
end
