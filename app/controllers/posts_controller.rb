class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  def index
    @posts = Post.all
  end

  def filter
    @posts = Post.tagged_with(params[:tag_name])
    render :index
  end

  def create
    params[:post][:tag_list].downcase!
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

  def show
    @post = Post.find(params[:id])
  end

end
