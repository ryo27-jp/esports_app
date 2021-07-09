class DivisionsController < ApplicationController
  def show
    @division = Division.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @division = Division.new
  end

  def create
    team = Team.find(params[:team_id])
    @division = team.divisions.create(division_params)

    if @division.save!
      redirect_to teams_path, success: '登録しました。'
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def edit
    @division = Division.find(params[:id])
  end

  def update
    @division = Division.find(params[:id])

    if @division.update(division_params)
      redirect_to division_path, success: '更新しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:id])

    @division.destroy!
    redirect_to teams_path, success: '削除しました。'
  end

  private

  def division_params
    params.require(:division).permit(:name, :description, :image, :team_id, tag_ids: [])
  end
end
