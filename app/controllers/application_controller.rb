class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :set_search

  private

  def set_search
    @search_form = SearchForm.new
  end
end
