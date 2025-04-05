# == Schema Information
#
# Table name: comments
#
#  id         :string(255)      not null, primary key
#  user_id    :bigint           not null
#  spot_id    :string(255)      not null
#  scene      :integer          not null
#  rating     :integer          not null
#  start_at   :time             not null
#  finish_at  :time             not null
#  title      :string(255)      not null
#  body       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :comment do
    scene { [ 0, 1, 2 ].sample }
    start_at { "002025-2-5T07:00" }
    finish_at { "002025-2-5T08:00" }
    rating { [ 1, 2, 3, 4, 5 ].sample }
    sequence(:title) { |n| "タイトル_#{n}" }
    sequence(:body) { |n| "本文_#{n}" }
    association :spot
    user { spot.user }
  end
end
