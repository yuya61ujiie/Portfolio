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
