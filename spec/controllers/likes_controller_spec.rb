require 'rails_helper'

RSpec.describe "Like", type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:like) { create(:like, user_id: user.id, post_id: post.id) }

  describe "いいね機能" do
    before do
      sign_in user
    end

    context 'いいねできる場合' do
      it "post_id, user_id,があればいいねできる" do
        expect(like).to be_valid
      end
    end

    context 'いいねできない場合' do
      it "ユーザーがログインしていなければいいねできない" do
        like.user_id = nil
        like.valid?
        expect(like.errors.full_messages).to include "Userを入力してください"
      end

      it "投稿したものがなければいいねできない" do
        like.post_id = nil
        like.valid?
        expect(like.errors.full_messages).to include "Postを入力してください"
      end
    end
  end
end
