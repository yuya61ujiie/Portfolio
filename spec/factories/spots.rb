# == Schema Information
#
# Table name: spots
#
#  id         :string(255)      not null, primary key
#  user_id    :bigint           not null
#  spot_name  :string(255)      not null
#  category   :integer          not null
#  address    :string(255)      not null
#  body       :text(65535)      not null
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :spot do
    id { nil }
    sequence(:spot_name) { |n| "店名_#{n}" }
    category { [ 1, 2, 3, 4 ].sample }
    sequence(:address) { |n| "住所_#{n}" }
    sequence(:body) { |n| "本文#{n}" }
    latitude { 43.0619 }
    longitude { 141.354 }
    association :user
  end
end
