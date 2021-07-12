class TeamsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @teams = pagy(Team.all, items: 6)
    @search_form = SearchForm.new
  end

  def search
    @search_form = SearchForm.new(search_params)
    @pagy ,@result = pagy(@search_form.search, items: 6)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path, success: '登録しました。'
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to team_path, success: '更新しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])

    @team.destroy!
    redirect_to teams_path, success: '削除しました。'
  end

  private

  def team_params
    params.require(:team).permit(:name, :about, :image)
  end

  def search_params
    params.require(:search_form).permit(:name, :choice)
  end
end
