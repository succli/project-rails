class Post < ApplicationRecord
  mount_uploader :featured_image, ImageUploader
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  private

    def image_size_validation
      errors[:featured_image] << "nem lehett nagyobb, mint 1 MB" if avatar.size > 1.0.megabytes
    end
end
