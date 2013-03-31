class Post < ActiveRecord::Base
  attr_accessible :description, :name, :body, :tag_list

  default_scope order('created_at desc')

  validates_presence_of :body, :tag_list

  acts_as_taggable

end
