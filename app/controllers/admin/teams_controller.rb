class Admin::TeamsController < TeamsController
  include Pagy::Backend
  before_action :user_admin

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

  def user_admin
    unless current_user&.admin?
      redirect_to root_path
    end
  end
end
