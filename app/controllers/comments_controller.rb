class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_post!
  before_action :find_comment!, only: [:edit, :update]

  def index
    @comments = @post.comments.order(created_at: desc)
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      #flash[:success] = "Comment successfully added"
      redirect_to @post, success: 'The comment has been created!' #comments_path(@comment)
    else
      render :new, danger: 'The post has not been created!'
    end
  end

  def edit

  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @post, success: 'The comment has been updated!'
    else
      render :edit, danger: 'The comment has not been updated!'
    end
  end
 
  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user_id  == current_user.id
      @comment.destroy
      redirect_to post_path(@comment.post), success: 'The comment has been erased!'
      #redirect_to @comment.post, success: 'The comment has been erased!'
    else
      redirect_to post_path(@comment.post), danger: 'The comment has not been erased!'
    end #else
  end

  private

  def find_post!
    @post = Post.find(params[:post_id])
  end

  def find_comment!
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
