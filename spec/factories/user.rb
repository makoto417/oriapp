FactoryBot.define do
  factory :user do
    id                    { 1 }
    nickname              { Faker::Internet.username(specifier: 2..15) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    profile               { Faker::Lorem.paragraph }

    after(:create) do |user|
      create(:user_console_relation, user: user, console: create(:console))
      create(:user_category_relation, user: user, category: create(:category))
    end
  end
end
