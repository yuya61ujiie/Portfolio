require "rails_helper"

RSpec.describe "Spots", type: :system do
  let(:user) { create(:user) }
  let(:spot) { create(:spot) }

  describe "ページ遷移確認" do
    describe "ログイン前" do
      context "スポットの新規登録ページにアクセス" do
        it "新規登録ページへのアクセスが失敗する" do
          visit new_spot_path
          expect(page).to have_content("ログインをしてください")
          expect(current_path).to eq new_user_session_path
        end
      end

      context "スポットの編集ページにアクセス" do
        it "編集ページへのアクセスが失敗する" do
          visit edit_spot_path(spot)
          expect(page).to have_content("ログインをしてください")
          expect(current_path).to eq new_user_session_path
        end
      end

      context "スポットの一覧ページにアクセス" do
        it "一覧ページへのアクセスが成功する" do
          spot_list = create_list(:spot, 3)
          visit spots_path
          expect(page).to have_content spot_list[0].spot_name
          expect(page).to have_content spot_list[1].spot_name
          expect(page).to have_content spot_list[2].spot_name
          expect(current_path).to eq spots_path
        end
      end

      context "スポットの詳細ページにアクセス" do
        it "詳細ページへのアクセスが成功する" do
          visit spot_path(spot)
          expect(page).to have_content spot.spot_name
          expect(current_path).to eq spot_path(spot)
        end
      end
    end

    describe "ログイン後" do
      context "スポットの新規投稿画面にアクセス" do
        it "新規投稿画面へのアクセスに成功する" do
          login_as(spot.user)
          click_on "マイページ"
          click_link "スポット投稿"
          expect(page).to have_content "スポット登録"
        end
      end
    end
  end
end
