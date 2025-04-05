# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  spot_id    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :user_id, uniqueness: { scope: :spot_id }
end
