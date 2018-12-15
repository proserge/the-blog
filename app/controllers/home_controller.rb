class HomeController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc).last(20)
  end
  
end
