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
       format.html { redirect_to projects_path, notice: 'User was successfully created.' }
       format.json { render :show, status: :created, location: @user }
     else
       format.html { render :new }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
 end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
