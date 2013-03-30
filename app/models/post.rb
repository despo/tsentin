class Post < ActiveRecord::Base
  attr_accessible :description, :name, :body
end
