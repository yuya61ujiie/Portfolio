require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "バリデーションチェック" do
    it "タグ名が存在している場合、有効である" do
      tag = build(:tag)
      expect(tag).to be_valid
    end

    it "タグ名が存在しない場合、無効である" do
      tag_without_name = build(:tag, name: "")
      expect(tag_without_name).to be_invalid
      expect(tag_without_name.errors[:name]).to eq [ "を入力してください" ]
    end

    it "タグ名がユニークではない場合、無効である" do
      tag = create(:tag)
      tag_with_duplicated_name = build(:tag, name: tag.name)
      expect(tag_with_duplicated_name).to be_invalid
      expect(tag_with_duplicated_name.errors[:name]).to eq [ "はすでに存在します" ]
    end
  end
end
