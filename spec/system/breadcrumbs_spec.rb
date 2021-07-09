require 'rails_helper'

RSpec.describe 'Breadcrumbs', type: :system do
  describe '正しい' do
    let!(:member) { create(:member) }

    it 'チーム名がパンくずに表示されている事' do
      visit team_path(member.division.team)
      expect(find('.current')).to have_content member.division.team.name
    end

    it '部門名がパンくずに表示されている事' do
      visit division_path(member.division)
      expect(find('.current')).to have_content member.division.name
    end

    it 'メンバー名がパンくずに表示されている事' do
      visit member_path(member)
      expect(find('.current')).to have_content member.name
    end
  end
end
