class HomeController < ApplicationController
  def index
    @search_form = SearchForm.new(params[:search])
    @teams = @search_form.search
  end
end
