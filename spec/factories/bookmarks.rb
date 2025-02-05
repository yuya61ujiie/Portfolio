FactoryBot.define do
  factory :bookmark do
    association :spot
    user { spot.user }
  end
end
