crumb :root do
  link 'チーム一覧', teams_path
end

crumb :team do |team|
  if team.present?
  elsif controller_name == 'divisions'
    team = Division.find(params[:id]).team
  else
    controller_name == 'members'
    team = Member.find(params[:id]).division.team
  end
  link team.name, team_path(team)
  parent :root
end

crumb :division do |division|
  if division.present?
  else
    division = Member.find(params[:id]).division
  end
  link division.name, division_path(division)
  parent :team
end

crumb :member do |member|
  link member.name, member_path(member)
  parent :division
end

crumb :search do |search|
  link search.name
  parent :root
end
# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
