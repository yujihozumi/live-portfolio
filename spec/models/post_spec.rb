require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  it "has a valid factory of user" do
    post = @post
    expect(post).to be_valid
  end

  it "全ての項目が入力されている場合、有効である" do
    @post = FactoryBot.build(:post)
    expect(@post).to be_valid
  end

  it "タイトルがない場合、無効である" do
    post = build(:post, title: "")
    post.valid?
    expect(post.errors[:title]).to include("失敗しました")
  end

  it "会場がない場合、無効である" do
    post = build(:post, live_venue: "")
    post.valid?
    expect(post.errors[:live_venue]).to include("失敗しました")
  end

  it "アーティストがない場合、無効である" do
    post = build(:post, artist: "")
    post.valid?
    expect(post.errors[:artist]).to include("失敗しました")
  end

  it "開演時間がない場合、無効である" do
    post = build(:post, start_time: "")
    post.valid?
    expect(post.errors[:start_time]).to include("失敗しました")
  end

  it "閉場時間がない場合、無効である" do
    post = build(:post, ending_time: "")
    post.valid?
    expect(post.errors[:ending_time]).to include("失敗しました")
  end

  it "開催日がない場合、無効である" do
    post = build(:post, start_date: "")
    post.valid?
    expect(post.errors[:start_date]).to include("失敗しました")
  end

  it "説明がない場合、無効である" do
    post = build(:post, body: "")
    post.valid?
    expect(post.errors[:body]).to include("失敗しました")
  end
end
