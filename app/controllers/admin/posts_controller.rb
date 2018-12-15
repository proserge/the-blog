class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
      @posts = Post.all
  end

  def show
    #@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'The post has been created!'
    else
      render :new, danger: 'The post has not been created!'
    end
  end

  def edit
    #@post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'The post has been updated!'
    else
      render :edit, danger: 'The post has not been updated!'
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, success: 'The post has been erased!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
