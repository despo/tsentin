class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :filter ]

  def index
    @posts = Post.all
  end

  def filter
    if params[:city_name] and params[:tag_name]
      @selected_tag = params[:tag_name]
      @posts = Post.where(city_id: @current_city.id).tagged_with(params[:tag_name])
    elsif params[:tag_name]
      @selected_tag = params[:tag_name]
      @posts = Post.tagged_with(params[:tag_name])
    else
      @posts = Post.where(city_id: @current_city.id)
      @tags = @posts.tag_counts_on(:tags).order('count  desc', 'name asc')
    end
    render :index
  end

  def create
    sanitize_properties
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

  def missing_http? link_url
    !URI.parse(link_url).scheme rescue false
  end

  def sanitize_properties
    params[:post][:tag_list].downcase!
    params[:post][:link] = "http://#{link_from(params)}" if missing_http?(link_from(params))
  end

  def link_from parameters
    params[:post][:link]
  end

end
