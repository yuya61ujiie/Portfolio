class Spot < ApplicationRecord
  validates :spot_name, presence: true, length: { maximum: 255 }
  validates :category, presence: true
  validates :address, presence: true
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  has_one_attached :image

  enum category: { cafe: 1, work_space: 2, karaoke: 3, other: 4 }

end
