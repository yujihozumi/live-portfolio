require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
    @like = FactoryBot.build(:like)
  end

  describe '正常値と異常値の確認' do
    context 'likeモデルのバリデーション' do
      it "user_idとpost_idがあれば保存できる" do
        expect(FactoryBot.create(:like)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors[:user_id]).to include("失敗しました")
      end

      it "post_idがなければ無効な状態であること" do
        @like.post_id = nil
        @like.valid?
        expect(@like.errors[:post_id]).to include("失敗しました")
      end

    end
  end
end
