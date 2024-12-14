class Spot < ApplicationRecord
  validates :spot_name, presence: true, length: { maximum: 255 }
  validates :category, presence: true
  validates :address, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validate :image_content_type
  validate :image_size

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image

  enum category: { cafe: 1, work_space: 2, karaoke: 3, other: 4 }

  def image_content_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, "：ファイル形式が、JPEG, PNG, GIF以外になっています。ファイル形式をご確認ください。")
    end
  end

  def image_size
    if image.attached? && image.blob.byte_size > 1.megabytes
      errors.add(:image, "：1MB以下のファイルをアップロードしてください。")
    end
  end

  def image_as_thumbnail
    return unless image&.attached?
    return unless image.content_type.in?(%w[image/jpeg image/png])
    image.variant(resize: "250x250").processed
  end

  def image_as_eye_catch
    return unless image&.attached?
    return unless image.content_type.in?(%w[image/jpeg image/png])
    image.variant(resize: "400x400").processed
  end
end
