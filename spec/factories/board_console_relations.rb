FactoryBot.define do
  factory :board_console_relation do
    association :board
    association :console
  end
end
