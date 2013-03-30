class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path
    else
      render action: 'new'
    end


  end

  def new
    @post = Post.new
  end
end
