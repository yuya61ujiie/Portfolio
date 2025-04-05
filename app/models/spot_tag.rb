# == Schema Information
#
# Table name: spot_tags
#
#  id         :bigint           not null, primary key
#  spot_id    :string(255)      not null
#  tag_id     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SpotTag < ApplicationRecord
  belongs_to :spot
  belongs_to :tag
end
