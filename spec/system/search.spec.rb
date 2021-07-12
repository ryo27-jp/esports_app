require 'rails_helper'

RSpec.describe 'Search', type: :system do
  describe '正しい' do
    let!(:member) { create(:member) }
    describe 'チーム名' do
      it '空で検索したらレコードが表示されている事' do
        visit teams_path
        select 'チーム名', from: 'search_form[choice]'
        fill_in 'search_form[name]', with: ''
        click_button '検索'
        expect(page).to have_content "チーム名: #{Team.first.name}"
      end
    end

    describe 'メンバー' do
      it '空で検索したらレコードが表示されている事' do
        visit teams_path
        select 'メンバー', from: 'search_form[choice]'
        fill_in 'search_form[name]', with: ''
        click_button '検索'
        expect(page).to have_content "チーム名: #{Member.first.name}"
      end
    end
  end
end
