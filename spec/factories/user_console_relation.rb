FactoryBot.define do
  factory :user_console_relation do
    association :user
    association :console
  end
end
