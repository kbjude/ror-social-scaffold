class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_user!
  before_action :authenticate_user!, only: [:show, :index]

  def index
      @post = Post.new
      timeline_posts
      @creator = creator(timeline_posts)
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def timeline_posts
    if current_user
      @timeline_posts ||= if 
      Post.all.ordered_by_most_recent.includes(:user)
    else
      redirect_to index
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
