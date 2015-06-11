class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @user.name_first = params[:name_first]
    @user.email = params[:email]

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name_first = params[:name_first]
    @user.name_last = params[:name_last]
    @user.email = params[:email]

    if @user.save
      redirect_to "/users", :notice => "Welcome to SpotMe, your user profile was created successfully!"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.name_first = params[:name_first]
    @user.name_last = params[:name_last]
    @user.email = params[:email]

    if @user.save
      redirect_to "/users", :notice => "Your user profiled was updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
