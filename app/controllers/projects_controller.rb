class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    new_reward = Reward.new(title: "Gratitude", description: "Thanks for the donation",
      min_amount: 0, max_amount: @project.goal)
    @project.rewards.push(new_reward)

    if @project.save
      redirect_to projects_url
    else
      redirect_to new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_owner = @project.user
    @project_rewards = @project.rewards
    @times_earned = {}
    @project_rewards.each do |reward|
      @times_earned[reward] = Fund.where(reward_id: reward.id).count

    end
    @comments = @project.comments.sort_by{|comment| comment.created_at}.reverse
    @sum_of_funds = @project.funds.sum(:amount)
    @amount_needed = @project.goal - @sum_of_funds
    if current_user
      @fund = @project.funds.build
      @comment = @project.comments.build
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
