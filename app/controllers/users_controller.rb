class UsersController < ApplicationController
  before_action :set_user  
  def profile
    @projects = @user.projects
    @posts = @user.posts
    @tasks = @user.tasks
  end

  def make_admin
    @user.update_attribute :role, :admin
    flash[:notice] = "Admin added."
    redirect_to user_path(@user)
  end

  def make_user
    @user.update_attribute :role, :user
    flash[:notice] = "Demoted to user."
    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:roles)
    end

end
