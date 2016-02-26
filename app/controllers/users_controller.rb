class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
   @user = User.new(user_params)

   respond_to do |format|
     if @user.save
       auto_login(@user)
       format.html { redirect_to projects_path, notice: 'User was successfully created.' }
       format.json { render :show, status: :created, location: @user }
     else
       format.html { render :new }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
  end

  def show
    @user_id = current_user.id
    @user_projects = Project.where(user_id: @user_id)
    @funds_for_projects = {}
    @amount_to_go = {}
    @user_projects.each do |project|
      @funds_for_projects[project] = project.funds.sum(:amount)
      @amount_to_go[project] = project.goal - @funds_for_projects[project]

    end

    @backed_projects = current_user.backed_projects


  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
