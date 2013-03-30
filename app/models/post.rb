class Post < ActiveRecord::Base
  attr_accessible :description, :name, :body

  default_scope order('created_at asc')

end
