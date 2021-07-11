class SearchForm
  include ActiveModel::Model

  attr_accessor  :id, :name, :tel
 
  def search
    team = Team
 
    team = team.where(name: name) if name.present?
 
    team
  end
end
  
