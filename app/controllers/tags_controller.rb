class TagsController < ApplicationController
  include Pagy::Backend
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @dpagy, @divisions = pagy(@tag.divisions, page_param: :dpage, items: 8)
    @mpagy, @members = pagy(@tag.members, page_param: :mpage, items: 8)
  end
end
