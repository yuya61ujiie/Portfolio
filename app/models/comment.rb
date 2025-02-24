class Comment < ApplicationRecord
  before_create :set_uuid

  validates :scene, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :rating, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  belongs_to :spot

  enum scene: { pc_work: 0, manual_work: 1, reading: 2 }
  enum rating: { star_1: 1, star_2: 2, star_3: 3, star_4: 4, star_5: 5 }

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
