class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @created_users = User.created_users
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friend_requests = @user.friend_requests
    @user_friends = @user.friends
  end
end
