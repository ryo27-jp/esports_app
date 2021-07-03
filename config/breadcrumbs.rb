crumb :root do
  link "Home", root_path
end

crumb :teams do
  link "チーム一覧", teams_path
  parent :root
end

crumb :team do |team|
  if team.present?
    link team.name, team_path(team)
  elsif controller_name == "divisions"
    team = Division.find(params[:id]).team
    link team.name, team_path(team)
  else controller_name == "members"
    team = Member.find(params[:id]).division.team
    link team.name, team_path(team)
  end
  parent :teams
end

crumb :division do |division|
  if division.present?
    link division.name, division_path(division)
  else
    division = Member.find(params[:id]).division
    link division.name, division_path(division)
  end
  parent :team
end

crumb :member do |member|
  link member.name, member_path(member)
  parent :division
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