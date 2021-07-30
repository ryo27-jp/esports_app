require 'rails_helper'

RSpec.describe 'Teams', type: :system do
  let!(:user) { create(:user) }

  describe '作成できない' do
    before(:all) do
      @team = create(:team)
    end

    it 'チーム名がなければ登録できない' do
      sign_in user
      visit new_admin_team_path
      fill_in 'チーム名', with: ''
      fill_in 'チーム概要', with: '作れるんです'
      attach_file 'team[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content 'チーム名を入力してください'
    end

    it 'チーム名はユニークである事' do
      sign_in user
      create(:team, name: 'testチーム')
      visit new_admin_team_path
      fill_in 'チーム名', with: 'testチーム'
      fill_in 'チーム概要', with: '作れるんです'
      attach_file 'team[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '登録に失敗しました。'
    end
  end

  describe '作成出来る' do
    it 'teamが作成出来る事' do
      sign_in user
      visit new_admin_team_path
      fill_in 'チーム名', with: 'これは作れる'
      fill_in 'チーム概要', with: '作れるんです'
      attach_file 'team[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '登録しました。'
    end
  end
end
