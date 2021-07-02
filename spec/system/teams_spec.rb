require 'rails_helper'

RSpec.describe 'Teams', type: :system do
  describe '作成できない' do
    before(:all) do
      @team = create(:team)
    end

    it 'チーム名がなければ登録できない' do
      visit new_team_path
      fill_in 'チーム名', with: ''
      fill_in 'チーム概要', with: '作れるんです'
      attach_file 'team[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content 'チーム名を入力してください'
    end

    it 'チーム名はユニークである事' do
      create(:team, name: 'testチーム')
      visit new_team_path
      fill_in 'チーム名', with: 'testチーム'
      fill_in 'チーム概要', with: '作れるんです'
      attach_file 'team[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '登録に失敗しました。'
    end
  end

  describe '作成出来る' do
    it 'teamが作成出来る事' do
      visit new_team_path
      fill_in 'チーム名', with: 'これは作れる'
      fill_in 'チーム概要', with: '作れるんです'
      attach_file 'team[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '登録しました。'
    end
  end
end
