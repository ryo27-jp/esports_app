class SearchForm
  include ActiveModel::Model

  attr_accessor :name, :choice
 
  def search
    if @choice == "team"
      team = Team
      team = team.where(name: name) if name.present?
  
      team
    else
      team = Member
      team = Member.where(name: name) if name.present?
  
      team
    end
  end
end
  
