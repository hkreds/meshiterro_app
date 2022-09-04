class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :comment , length: { minimum: 1, maximum: 200 }
end
