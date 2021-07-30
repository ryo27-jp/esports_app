class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @division = @member.division
  end
end
