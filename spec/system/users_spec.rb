require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ログイン' do
    let!(:user) { create(:user) }

    it 'ログインできる' do
      visit new_user_session_path
      binding.pry
      fill_in 'Eメール', with: 'test1@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'

      expect(page).to have_content 'ログインしました。'
    end

    it 'ログインできない' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'dame@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'

      expect(page).to have_content 'Eメールまたはパスワードが違います。'
    end
  end

  describe 'サインイン' do
    it 'アカウント作成できる' do
      visit new_user_registration_path
      fill_in 'Eメール', with: 'user@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'
      click_button 'アカウント登録'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end

    it 'アカウント作成できない' do
      visit new_user_registration_path
      fill_in 'Eメール', with: 'user@example.com'
      fill_in 'パスワード', with: 'pass'
      fill_in 'パスワード', with: 'pass'
      click_button 'アカウント登録'
      expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
    end
  end
end
