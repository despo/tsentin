class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_tags

  private
    def set_tags
      @tags = Post.tag_counts_on(:tags).order('count  desc')
    end
end
