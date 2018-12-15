class BlogsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    #redirect_to 
  end

  def new
    @blog = Blog.new
  end


  def create
    @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
      if @blog.save
        redirect_to @blog, success: 'The blog has been created!'
      else
        render :new, danger: 'The blog has not been created!'
      end
  end

  def edit

  end

  def update
    if @blog.update_attributes(blog_params)
      redirect_to @blog, success: 'The blog has been updated!'
    else
      render :edit, danger: 'The blog has not been updated!'
    end
  end

  def destroy
    @blog.destroy
    redirect_to home_index_path, success: 'The blog has been erased!'
  end

  private

  def set_blog
      @blog = Blog.find(params[:id]) # or Blog.Blog.where(user_id: current_user.id)
  end

  def blog_params
      params.require(:blog).permit(:name)
  end


end