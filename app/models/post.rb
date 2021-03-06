# encoding: UTF-8
class Post < ActiveRecord::Base
  attr_accessible :description, :name, :body, :tag_list, :link, :city_id

  default_scope order('posts.created_at desc')

  validates_presence_of :body, :tag_list, :name
  belongs_to :user
  belongs_to :city

  acts_as_taggable

  has_many :favorites
  has_many :users, through: :favorites, as: :users_favorited


  def city_name
    self.city ? self.city.name : "Σε όλες τις πόλεις"
  end

end
