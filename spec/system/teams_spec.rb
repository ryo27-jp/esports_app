require 'rails_helper'

RSpec.describe "Teams", type: :system do
  describe "作成できない" do 
    before(:all) do
      @team = create(:team)
    end

    it "nameがなければ登録できない" do
      visit new_team_path
      fill_in 'Name', with: ''
      fill_in 'About', with: '作れるんです'
      attach_file "team[image]", "db/fixtures/犬.jpg"
      click_button 'Create Team'

      expect(page).to have_content '登録に失敗しました。'
    end

    it "nameはユニークである事" do
      visit new_team_path
      fill_in 'Name', with: 'testチーム'
      fill_in 'About', with: '作れるんです'
      attach_file "team[image]", "db/fixtures/犬.jpg"
      click_button 'Create Team'

      expect(page).to have_content '登録に失敗しました。'
    end
  end
  
  describe "作成出来る" do
    it "teamが作成出来る事" do
      visit new_team_path
      fill_in 'Name', with: 'これは作れる'
      fill_in 'About', with: '作れるんです'
      attach_file "team[image]", "db/fixtures/犬.jpg"
      click_button 'Create Team'

      expect(page).to have_content '登録しました。'
    end
  end
end
