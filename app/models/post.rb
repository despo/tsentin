class Post < ActiveRecord::Base
  attr_accessible :description, :name, :body, :tag_list, :link

  default_scope order('created_at desc')

  validates_presence_of :body, :tag_list
  belongs_to :user

  acts_as_taggable

end
