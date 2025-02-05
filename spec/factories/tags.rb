FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "タグ_#{n}" }
  end
end
