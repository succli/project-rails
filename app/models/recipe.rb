class Recipe < ApplicationRecord
  mount_uploader :featured_image, ImageUploader
  belongs_to :user
  has_and_belongs_to_many :recipe_category
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

  private
    def image_size_validation
      errors[:featured_image] << "nem lehett nagyobb, mint 1 MB" if featured_image.size > 1.0.megabytes
    end
end
