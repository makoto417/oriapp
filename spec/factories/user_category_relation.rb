FactoryBot.define do
  factory :user_category_relation do
    association :user
    association :category
  end
end
