# == Schema Information
#
# Table name: spots
#
#  id         :string(255)      not null, primary key
#  user_id    :bigint           not null
#  spot_name  :string(255)      not null
#  category   :integer          not null
#  address    :string(255)      not null
#  body       :text(65535)      not null
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "バリデーションチェック" do
    it "店名、カテゴリ、住所、説明がある場合、有効である" do
      spot = build(:spot)
      expect(spot).to be_valid
      expect(spot.errors).to be_empty
    end

    it "店名がない場合、無効である" do
      spot_without_spot_name = build(:spot, spot_name: "")
      expect(spot_without_spot_name).to be_invalid
      expect(spot_without_spot_name.errors[:spot_name]).to eq [ "を入力してください" ]
    end

    it "店名が256文字以上の場合、無効である" do
      spot_long_spot_name = build(:spot, spot_name: "a" * 256)
      expect(spot_long_spot_name).to be_invalid
      expect(spot_long_spot_name.errors[:spot_name]).to eq [ "は255文字以内で入力してください" ]
    end

    it "カテゴリがない場合、無効である" do
      spot_without_category = build(:spot, category: "")
      expect(spot_without_category).to be_invalid
      expect(spot_without_category.errors[:category]).to eq [ "を入力してください" ]
    end
    it "住所がない場合、無効である" do
      spot_without_address = build(:spot, address: "")
      expect(spot_without_address).to be_invalid
      expect(spot_without_address.errors[:address]).to eq [ "を入力してください" ]
    end

    it "住所が256文字以上の場合、無効である" do
      spot_long_address = build(:spot, address: "a" * 256)
      expect(spot_long_address).to be_invalid
      expect(spot_long_address.errors[:address]).to eq [ "は255文字以内で入力してください" ]
    end

    it "説明がない場合、無効である" do
      spot_without_body = build(:spot, body: "")
      expect(spot_without_body).to be_invalid
      expect(spot_without_body.errors[:body]).to eq [ "を入力してください" ]
    end
  end
end
