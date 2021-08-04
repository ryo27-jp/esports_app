require 'rails_helper'

RSpec.describe 'Tag', type: :system do
  let!(:tag) { create(:tag) }
  let!(:member) { create(:member) }
  describe '表示される' do
    let!(:divisions_tag) { create(:divisions_tag, tag_id: tag.id,division_id: member.division.id) }
    let!(:members_tag) { create(:members_tag, tag_id: tag.id,member_id: member.id) }
    it 'tagを選択したら関連するレコードを表示すること' do
      visit division_path(member.division)
      click_link "#{tag.title}"
      expect(page).to have_content member.division.name
    end

    it 'divisionと同じタグを持つmemberが表示されること' do
      visit division_path(member.division)
      click_link "#{tag.title}"
      expect(page).to have_content member.name
    end
  end

  describe '表示されない' do
    let!(:tag_a) { create(:tag,title:"tag2") }
    let!(:divisions_tag) { create(:divisions_tag, tag_id: tag.id,division_id: member.division.id) }
    let!(:members_tag) { create(:members_tag, tag_id: tag_a.id,member_id: member.id) }
    it 'tag2は表示されていないこと' do
      visit division_path(member.division)
      expect(page).not_to have_content tag_a.title
    end

    it 'divisionと同じタグを持つmemberが表示されること' do
      visit division_path(member.division)
      click_link "#{tag.title}"
      expect(page).not_to have_content member.name
    end
  end
end
