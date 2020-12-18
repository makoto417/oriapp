FactoryBot.define do
  factory :post do
    id    { 1 }
    message { Faker::Lorem.paragraph }

    association :user
    association :game

    after(:create) do |user|
      create(:post_console_relation, user: user, console: create(:console))
      create(:post_category_relation, user: user, console: create(:category))
    end
  end
end
