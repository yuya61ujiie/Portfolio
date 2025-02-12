require "rails_helper"

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "ログイン前" do
    describe "ユーザー新規登録" do
      context "フォームの入力値が正常" do
        it "ユーザーの新規作成が成功する" do
          visit new_user_registration_path
          fill_in "氏名", with: "yuya ujiie"
          fill_in "メールアドレス", with: "email@example.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "登録"
          expect(page).to have_content "アカウント登録が完了しました"
          expect(current_path).to eq root_path
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザーの新規登録が失敗する" do
          visit new_user_registration_path
          fill_in "氏名", with: "yuya ujiie"
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "登録"
          expect(page).to have_content "メールアドレスを入力してください"
          expect(current_path).to eq new_user_registration_path
        end
      end

      context "登録済みのメールアドレスを使用" do
        it "ユーザーの新規登録が失敗する" do
          exited_user = create(:user)
          visit new_user_registration_path
          fill_in "氏名", with: "yuya ujiie"
          fill_in "メールアドレス", with: exited_user.email
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "登録"
          expect(page).to have_content "メールアドレスはすでに存在します"
          expect(current_path).to eq new_user_registration_path
          expect(page).to have_field "メールアドレス", with: exited_user.email
        end
      end
    end

    describe "ログイン" do
      context "フォームの入力値が正常" do
        it "ログインが成功する" do
          visit new_user_session_path
          fill_in "メールアドレス", with: user.email
          fill_in "パスワード", with: "password"
          click_button "ログイン"
          expect(page).to have_content "ログインに成功しました。"
          expect(current_path).to eq root_path
        end
      end

      context "フォームが未入力" do
        it "ログインが失敗する" do
          visit new_user_session_path
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: "password"
          click_button "ログイン"
          expect(page).to have_content "メールアドレスまたはパスワードが正しくありません。"
          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end

  describe "ログイン後" do
    context "ログアウトをクリック" do
      it "ログアウトが成功する", js: true do
        login_as(user)
        find(".dropdown-toggle").click
        click_link "ログアウト"
        expect(page).to have_content "ログアウトしました"
        expect(current_path).to eq root_path
      end
    end
  end
end
