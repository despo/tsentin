class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_tags, :set_cities

  private
    def set_tags
      @tags = Post.tag_counts_on(:tags).order('count  desc', 'name asc')
    end

    def set_cities
      @cities = City.all
    end
end
