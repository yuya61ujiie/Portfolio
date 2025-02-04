class Spot < ApplicationRecord
  validates :spot_name, presence: true, length: { maximum: 255 }
  validates :category, presence: true
  validates :address, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validate :image_content_type
  validate :image_size

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags

  has_one_attached :image

  enum category: { cafe: 1, work_space: 2, karaoke: 3, other: 4 }

  scope :spot_name_contain, ->(word) { where("spot_name LIKE ?", "%#{word}%") }
  scope :by_category, ->(category) { where(category: category) }
  scope :address_contain, ->(word) { where("address LIKE ?", "%#{word}%") }
  scope :by_tag, ->(tag_id) { joins(:tags).where(spot_tags: { tag_id: tag_id }) }

  geocoded_by :address
  after_validation :geocode

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
    return unless image.content_type.in?(%w[image/jpeg image/png])
    image.variant(resize_to_limit: [ 250, 250 ]).processed
  end

  def image_as_eye_catch
    return unless image.content_type.in?(%w[image/jpeg image/png])
    image.variant(resize_to_limit: [ 400, 400 ]).processed
  end

  def save_tags(save_post_tags)
    current_tags = self.tags.pluck(:name) if self.tags.present?
    old_tags = current_tags - save_post_tags
    new_tags = save_post_tags - current_tags

    old_tags.each do |old_tag|
      self.tags.delete Tag.find_by(name: old_tag)
    end

    new_tags.each do |new_tag|
      spot_tag = Tag.find_or_create_by(name: new_tag)
      self.tags << spot_tag
    end
  end
end
