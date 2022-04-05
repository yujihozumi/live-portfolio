require 'rails_helper'

RSpec.describe "Posts", type: :feature do
  let(:user) { create(:user) }
  let(:post) { build(:post, user_id: user.id) }
  let(:photo) { build(:photo, post_id: post_id) }

  it 'ログイン後投稿できるか' do
    sign_in user
    visit new_post_path
    fill_in 'post_title', with: 'test'
    fill_in 'post_body', with: 'test'
    fill_in 'post_artist', with: 'test'
    fill_in 'post_live_venue', with: 'tokyo'
    fill_in 'post_start_date', with: '2020/10/10'
    fill_in 'post_start_time', with: '10:10'
    fill_in 'post_ending_time', with: '11:11'
    attach_file 'post[photos_attributes][0][image]', "#{Rails.root}/app/assets/images/test.png"
    click_on '投稿する'
    expect(page).to have_content '投稿が保存されました'
    expect(page).to have_selector 'p', text: @post_title
  end

  describe "表示されるか" do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
    end

    it "投稿一覧ページに特定の文字列が表示されているか" do
      sign_in @user
      visit root_path
      expect(page).to have_selector "p", text: @post_title
      expect(page).to have_selector "p", text: @post_user_name
    end

    it '投稿詳細ページに特定の文字列が表示されているか' do
      sign_in @user
      visit posts_path(@post)
      expect(page).to have_selector "p", text: @post_title
      expect(page).to have_selector "p", text: @post_artist
      expect(page).to have_selector "p", text: @post_live_venue
      expect(page).to have_selector "p", text: @post_start_date
      expect(page).to have_selector "p", text: @post_start_time
      expect(page).to have_selector "p", text: @post_ending_time
      expect(page).to have_selector "p", text: @post_body
    end
  end

end
