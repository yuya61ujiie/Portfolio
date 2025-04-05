# == Schema Information
#
# Table name: tags
#
#  id         :string(255)      not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "タグ_#{n}" }
  end
end
