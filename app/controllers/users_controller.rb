class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @created_user = User.where(user_id => 18)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
