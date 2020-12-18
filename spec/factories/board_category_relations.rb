FactoryBot.define do
  factory :board_category_relation do
    association :board
    association :category
  end
end
