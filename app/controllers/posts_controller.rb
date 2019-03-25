class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :set_blog, only: [:index, :new] # :create, :index]

  def index
      #@posts = Post.where("blog_id = ?", params[:blog_id])
      #@posts = Post.all




      if params[:blog_id]
        @posts = @blog.posts
      else
        render 'root'
      end


  end

  def show
    #@post = Post.find(params[:id])
    @post.increment!(:view_count)
  end

  def new
    @post = Post.new
  end

  def create
    #@post = Blog.posts.new(post_params)
    @post = Post.new(post_params)
    @post.blog_id = current_user.blog.id #@blog.id
    if @post.save
      redirect_to @post.blog, success: 'The post has been created!'
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
    redirect_to blog_posts_path, success: 'The post has been erased!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_blog
    @blog = Blog.find(current_user.blog.id)
  end

  def post_params
    params.require(:post).permit(:title, :body, :blog_id)
  end
end
