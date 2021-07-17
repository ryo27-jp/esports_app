class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :set_search

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  
  include ErrorHandlers if Rails.env.production?

  private

  def set_search
    @search_form = SearchForm.new
  end

end
