require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do
    it "名前、メール、パスワード、パスワード確認がある場合、有効である" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it "名前がない場合、無効である" do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq [ "を入力してください" ]
    end

    it "アドレスがない場合、無効である" do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq [ "を入力してください" ]
    end

    it "アドレスが重複している場合、無効である" do
      user = create(:user)
      user_with_duplicated_email = build(:user, email: user.email)
      expect(user_with_duplicated_email).to be_invalid
      expect(user_with_duplicated_email.errors[:email]).to eq [ "はすでに存在します" ]
    end

    it "パスワードがない場合、無効である" do
      user_without_password = build(:user, password: "")
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq [ "を入力してください" ]
    end

    it "パスワードが6文字以下の場合、無効である" do
      user_short_password = build(:user, password: "pass", password_confirmation: "pass")
      expect(user_short_password).to be_invalid
      expect(user_short_password.errors[:password]).to eq [ "は6文字以上で入力してください" ]
    end

    it "パスワード確認がない場合、無効である" do
      user_without_password_confirmation = build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq [ "とパスワードの入力が一致しません" ]
    end
  end
end
