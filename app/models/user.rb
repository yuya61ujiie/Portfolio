class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :comments
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_spots, through: :bookmarks, source: :spot

  def own?(object)
    id == object&.user_id
  end

  def bookmark(spot)
    bookmark_spots << spot
  end

  def unbookmark(spot)
    bookmark_spots.destroy(spot)
  end

  def bookmark?(spot)
    bookmark_spots.include?(spot)
  end
end
