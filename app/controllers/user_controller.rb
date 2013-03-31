class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = Post.limit(5).find_by_user_id(current_user.id)
  end
end
