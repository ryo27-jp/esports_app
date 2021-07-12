class SearchForm
  include ActiveModel::Model

  attr_accessor :name, :choice

  def search
    if @choice == 'team'
      team = Team
      team = team.where(name: name) if name.present?

    else
      team = Member
      team = Member.where(name: name) if name.present?

    end
    team
  end
end
