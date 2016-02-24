class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else
      redirect_to new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_rewards = @project.rewards
    @project_comments = @project.comments
    @sum_of_funds = @project.funds.sum(:amount)
    if current_user
      @fund = @project.funds.build #need a form for fund
      @comment = @project.comments.build #need a form for comment
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      redirect_to edit_project_path(@project)
    end

  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :end_date,
    rewards_attributes: [:title, :description, :min_amount, :max_amount, :_destroy])
  end
end
