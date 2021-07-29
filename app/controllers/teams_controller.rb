class TeamsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @teams = pagy(Team.all, items: 6)
    @search_form = SearchForm.new
  end

  def search
    @search_form = SearchForm.new(search_params)
    @pagy, @result = pagy(@search_form.search, items: 6)
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def search_params
    params.require(:search_form).permit(:name, :choice)
  end
end
