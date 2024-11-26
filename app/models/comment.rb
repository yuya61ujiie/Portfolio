class Comment < ApplicationRecord
  validates :scene, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
#  validate :start_finish_check
  validates :rating, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

#	def start_finish_check
#    errors.add(:finish_at, "は開始時刻より遅い時間を選択してください") if self.start_at > self.finish_at
#  end

  belongs_to :user
  belongs_to :spot

  enum scene: { pc_work: 0, manual_work: 1, reading: 2 }
  enum rating: { "0.5": 0, "1.0": 1, "1.5": 2, "2.0": 3, "2.5": 4, "3.0": 5 }
end
