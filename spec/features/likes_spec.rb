require 'rails_helper'

RSpec.describe "Likes", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
    @like = FactoryBot.build(:like)
  end

  context "いいねをクリックした場合" do
    it 'ログイン後いいねを押せるか' do
      sign_in @user
      visit root_path
      click_on 'いいね', match: :first
      expect(page).to have_css '.fas'
      expect(page).to have_css "div#like-icon-post-#{post.id}", text: '1'
    end
  end
end
