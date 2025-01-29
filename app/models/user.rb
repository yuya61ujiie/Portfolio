class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:google_oauth2]

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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(
          name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
