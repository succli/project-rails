class AddFeaturedImageToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :featured_image, :string
  end
end
