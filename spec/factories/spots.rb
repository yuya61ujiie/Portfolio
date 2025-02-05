FactoryBot.define do
  factory :spot do
    sequence(:spot_name) { |n| "店名_#{n}" }
    category { [1, 2, 3, 4].sample }
    sequence(:address) { |n| "住所_#{n}" }
    sequence(:body) { |n| "本文#{n}" }
    latitude { 43.0619 }
    longitude { 141.354 }
    association :user
  end
end
