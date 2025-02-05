require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context '全てのフィールドが有効な場合' do
    it '有効である' do
      bookmark = build(:bookmark)
      expect(bookmark).to be_valid
    end
  end

  context 'ユーザーと掲示板の組み合わせがユニークではない場合' do
    it '無効である' do
      bookmark = create(:bookmark)
      new_bookmark = build(:bookmark, user: bookmark.user, spot: bookmark.spot)
      new_bookmark.valid?
      expect(new_bookmark.errors[:user_id]).to eq ['はすでに存在します']
    end
  end
end
