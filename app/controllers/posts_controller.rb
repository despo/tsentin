class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  before_filter :set_tags

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

  def show
    @post = Post.find(params[:id])
  end

  private
    def set_tags
      @tags = Post.tag_counts_on(:tags)
    end
end
