class ChangeImageToImages < ActiveRecord::Migration
  def change
  	add_column :listings, :images, :json
  	remove_column :listings, :image, :string
  end
end
