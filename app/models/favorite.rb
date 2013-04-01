class Favorite < ActiveRecord::Base
  attr_accessible :user, :post
  belongs_to :user
  belongs_to :post

  validates :user_id, :uniqueness => {:scope => :post_id}
end

