class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence:true
  validates :image, presence:true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post_image = PostImage.where("shop_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @post_image = PostImage.where("shop_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @post_image = PostImage.where("shop_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @post_image = PostImage.where("shop_name LIKE?","%#{word}%")
    else
      @post_image = PostImage.all
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
