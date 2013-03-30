class Post < ActiveRecord::Base
  attr_accessible :description, :name, :body, :tag_list

  default_scope order('created_at desc')

   acts_as_taggable

end
