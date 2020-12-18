FactoryBot.define do
  factory :post_console do
    association :post
    association :console
  end
end
