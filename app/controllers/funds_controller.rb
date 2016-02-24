class FundsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @fund = @project.funds.build(fund_params)
    @fund.user = current_user

    if @fund.save
      redirect_to project_path(@project), notice: "Thank you for funding this project!"
    else
      redirect_to project_path(@project), notice: "Something went wrong, fund not saved"
    end
  end

  private
  def fund_params
    params.require(:fund).permit(:amount)
  end
end
