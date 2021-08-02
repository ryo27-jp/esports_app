class TagsController < ApplicationController
  include Pagy::Backend
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @dpagy, @divisions = pagy(@tag.divisions,page_param: :dpage, items: 8)
    @mpagy, @members = pagy(@tag.members,page_param: :mpage, items: 8)
  end
  
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to teams_path, success: '登録しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to team_path, success: '更新しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])

    @tag.destroy!
    redirect_to teams_path, danger: '削除しました。'
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
