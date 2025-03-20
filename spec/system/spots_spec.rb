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
      before do
        login_as(spot.user)
      end

      context "スポットの新規投稿画面にアクセス" do
        it "新規投稿画面へのアクセスに成功する", js: true do
          click_on "マイページ"
          click_link "スポット投稿"
          expect(page).to have_content "スポット登録"
        end
      end

      context "スポットの編集画面にアクセス" do
        it "編集画面へのアクセスに成功する", js: true do
          visit edit_spot_path(spot)
          expect(page).to have_content "スポット編集"
          expect(page).to have_content spot.spot_name
        end
      end
    end
  end

  describe "CRUD" do
    before do
      login_as(spot.user)
    end

    describe "スポットの新規作成" do
      context "フォームの入力値が正常" do
        it "新規作成が成功する" do
          visit new_spot_path
          fill_in "店名", with: "朝活カフェ"
          select "カフェ", from: "カテゴリ"
          fill_in "住所", with: "北海道札幌市"
          fill_in "説明", with: "テスト"
          fill_in "タグ", with: "テスト,tag"
          click_button "登録"
          expect(page).to have_content "スポットを登録しました"
          expect(page).to have_content "朝活カフェ"
        end
      end

      context "店名が未記入" do
        it "新規作成が失敗する" do
          visit new_spot_path
          fill_in "店名", with: nil
          select "カフェ", from: "カテゴリ"
          fill_in "住所", with: "北海道札幌市"
          fill_in "説明", with: "テスト"
          fill_in "タグ", with: "テスト,tag"
          click_button "登録"
          expect(page).to have_content "店名を入力してください"
          expect(current_path).to eq new_spot_path
        end
      end
    end

    describe "スポットの編集" do
      context "フォームの入力値が正常" do
        it "編集が成功する" do
          visit edit_spot_path(spot)
          expect(page).to have_content "#{spot.spot_name}"
          fill_in "店名", with: "朝活カフェ"
          click_button "更新"
          expect(page).to have_content "スポットを編集しました"
          expect(page).to have_content "朝活カフェ"
        end
      end

      context "店名が未記入" do
        it "編集が失敗する" do
          visit edit_spot_path(spot)
          expect(page).to have_content "#{spot.spot_name}"
          fill_in "店名", with: nil
          click_button "更新"
          expect(page).to have_content "店名を入力してください"
          expect(current_path).to eq edit_spot_path(spot)
        end
      end
    end
  end
end
