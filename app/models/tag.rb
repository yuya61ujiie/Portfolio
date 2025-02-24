class Tag < ApplicationRecord
  before_create :set_uuid

  has_many :spot_tags, dependent: :destroy
  has_many :spots, through: :spot_tags

  validates :name, presence: true, uniqueness: true

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
