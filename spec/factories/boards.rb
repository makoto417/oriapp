FactoryBot.define do
  factory :board do
    id    { 1 }
    title { Faker::Lorem.sentence }

    association :user
    association :game

    after(:create) do |user|
      create(:board_console_relation, user: user, console: create(:console))
      create(:board_category_relation, user: user, console: create(:category))
    end
  end
end
