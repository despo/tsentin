class ChangePostsCityIdToInt < ActiveRecord::Migration
  def up
    remove_column :posts, :city_id
    add_column :posts, :city_id, :integer
  end
end
