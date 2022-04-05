require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '正常値と異常値の確認' do
    context 'commentモデルのバリデーション' do
      it "user_idとpost_idがあれば保存できる" do
        expect(@comment).to be_valid
      end

      it "コメントが空の場合投稿できない" do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment失敗しました")
      end

      it "ユーザーが紐付いていなければコメントできない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end

      it "Postが無ければコメントできない" do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Postを入力してください")
      end

    end
  end
end
