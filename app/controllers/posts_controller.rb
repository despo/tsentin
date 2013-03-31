class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :filter ]

  def index
    @posts = Post.all
  end

  def filter
    if params[:city_name]
      @current_city = City.find_by_name(params[:city_name])
      if params[:tag_name]
        @selected_tag = params[:tag_name]
        @posts = Post.where(city_id: @current_city.id).tagged_with(params[:tag_name])
      else
        @posts = Post.where(city_id: @current_city.id)
      end
      @tags = @posts.tag_counts_on(:tags).order('count  desc', 'name asc')
    elsif params[:tag_name]
      @selected_tag = params[:tag_name]
      @posts = Post.tagged_with(params[:tag_name])
    end
    render :index
  end

  def create
    params[:post][:tag_list].downcase!
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
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
