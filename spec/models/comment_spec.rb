require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーションチェック" do
    it "利用シーン、開始時間、終了時間、おすすめ度、タイトル、本文がある場合、有効である" do
      comment = build(:comment)
      expect(comment).to be_valid
      expect(comment.errors).to be_empty
    end

    it "利用シーンがない場合、無効である" do
      comment_without_scene = build(:comment, scene: "")
      expect(comment_without_scene).to be_invalid
      expect(comment_without_scene.errors[:scene]).to eq [ "を入力してください" ]
    end

    it "開始時間がない場合、無効である" do
      comment_without_start_at = build(:comment, start_at: "")
      expect(comment_without_start_at).to be_invalid
      expect(comment_without_start_at.errors[:start_at]).to eq [ "を入力してください" ]
    end

    it "終了時間がない場合、無効である" do
      comment_without_finish_at = build(:comment, finish_at: "")
      expect(comment_without_finish_at).to be_invalid
      expect(comment_without_finish_at.errors[:finish_at]).to eq [ "を入力してください" ]
    end

    it "おすすめ度がない場合、無効である" do
      comment_without_rating = build(:comment, rating: "")
      expect(comment_without_rating).to be_invalid
      expect(comment_without_rating.errors[:rating]).to eq [ "を入力してください" ]
    end

    it "タイトルがない場合、無効である" do
      comment_without_title = build(:comment, title: "")
      expect(comment_without_title).to be_invalid
      expect(comment_without_title.errors[:title]).to eq [ "を入力してください" ]
    end

    it "本文がない場合、無効である" do
      comment_without_body = build(:comment, body: "")
      expect(comment_without_body).to be_invalid
      expect(comment_without_body.errors[:body]).to eq [ "を入力してください" ]
    end
  end
end
