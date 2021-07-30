require 'rails_helper'

RSpec.describe 'Divisions', type: :system do
  let(:team) { create(:team, name: 'テスト') }
  let!(:user) { create(:user) }

  describe '作成できない' do
    let!(:division) { create(:division) }

    it '部門名がなければ登録できない' do
      visit new_admin_team_division_path(team)
      fill_in '部門名', with: ''
      fill_in '部門概要', with: '作れないです'
      attach_file 'division[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '部門名を入力してください'
    end

    it '部門名はユニークである事' do
      visit new_admin_team_division_path(team)
      fill_in '部門名', with: 'test部門'
      fill_in '部門概要', with: '作れないです'
      attach_file 'division[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '登録に失敗しました。'
    end
  end

  describe '作成出来る' do
    let!(:tag) { create(:tag) }
    it 'divisionが作成出来る事' do
      visit new_admin_team_division_path(team)
      fill_in '部門名', with: 'これは作れる'
      fill_in '部門概要', with: '作れるんです'
      attach_file 'division[image]', 'db/fixtures/犬.jpg'
      check 'division_tag_ids_1'
      click_button '登録する'

      expect(page).to have_content '登録しました。'
    end
  end
end
