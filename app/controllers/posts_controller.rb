class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')  
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def show
    Post.find(params[:id])
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
