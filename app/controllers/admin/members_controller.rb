class Admin::MembersController < MembersController
  def new
    @division = Division.find(params[:division_id])
    @member = Member.new
  end

  def create
    @division = Division.find(params[:division_id])
    @member = @division.members.new(member_params)

    if @member.save
      redirect_to member_path(@member), success: '登録しました。'
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to member_path, success: '更新しました。'
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])

    @member.destroy!
    redirect_to teams_path, success: '削除しました。'
  end

  private

  def member_params
    params.require(:member).permit(:name, :url, :biography, :image, tag_ids: [])
  end
end
