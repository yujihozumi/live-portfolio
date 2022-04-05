require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user) { create(:user) }
  image_path = Rails.root.join('spec/fixtures/test.jpg')

  describe 'ユーザーが作成できること' do
    before do
      @user = User.create(
        name: 'test',
        user_body: 'body',
        email: 'test@example.com',
        password: 'password1234',
      )
    end

    scenario 'ログインできるか' do
      visit root_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'サインインする'
      expect(page).to have_content "ログインしました。"
    end

    scenario 'ログアウトできるか' do
      visit user_path(@user)
      click_on 'サインアウト'
      expect(page).to have_content 'ログインもしくはアカウント登録してください。'
    end

    scenario 'ユーザー詳細ページに行きnameとemailとbodyが表示されているか' do
      sign_in @user
      visit user_path(@user)
      expect(page).to have_selector 'h1', text: @user.name
      expect(page).to have_selector 'p', text: @user.email
      expect(page).to have_selector 'p', text: @user.user_body
    end

    scenario 'プロフィール編集ページに遷移するか' do
      sign_in @user
      visit user_path(@user)
      click_link 'プロフィールを編集'
      expect(page).to have_current_path edit_user_registration_path
    end

    scenario 'プロフィール画像を設定できるか' do
      sign_in @user
      visit user_path(@user)
      click_link 'プロフィールを編集'
      attach_file('user[avatar]', image_path, make_visible: true)
      click_on '変更する'
      visit user_path(@user)
      expect(page).to have_selector "img[alt='user-icon']"
    end
  end

  describe '画像' do
    it '画像があるか' do
      sign_in user
      visit user_path(user)
      click_link 'プロフィールを編集'
      attach_file('user[avatar]', image_path, make_visible: true)
      click_on '変更する'
      visit user_path(user)
      expect(page).to have_selector "img[alt='user-icon']"
    end
  end
end
