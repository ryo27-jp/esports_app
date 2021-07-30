require 'rails_helper'

RSpec.describe 'members', type: :system do
  let(:division) { create(:division, name: 'テスト') }
  let(:user) { create(:user) }

  describe '作成できない' do
    let!(:member) { create(:member) }

    it '名前がなければ登録できない' do
      visit new_admin_division_member_path(division)
      fill_in '名前', with: ''
      fill_in 'SNS', with: '作れないです'
      fill_in '略歴', with: '作れないです'
      attach_file 'member[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '名前を入力してください'
    end

    it '名前はユニークである事' do
      visit new_admin_division_member_path(division)
      fill_in '名前', with: 'テスト名前'
      fill_in 'SNS', with: '作れないです'
      fill_in '略歴', with: '作れないです'
      attach_file 'member[image]', 'db/fixtures/犬.jpg'
      click_button '登録する'

      expect(page).to have_content '登録に失敗しました。'
    end
  end

  describe '作成出来る' do
    let!(:tag) { create(:tag) }
    it 'memberが作成出来る事' do
      visit new_admin_division_member_path(division)
      fill_in '名前', with: 'これは作れる'
      fill_in 'SNS', with: '作れないです'
      fill_in '略歴', with: '作れるんです'
      attach_file 'member[image]', 'db/fixtures/犬.jpg'
      check 'member_tag_ids_1'
      click_button '登録する'

      expect(page).to have_content '登録しました。'
    end
  end
end
