class Console < ApplicationRecord
  has_many :user_console_relations
  has_many :board_console_relations
  has_many :post_console_relations
  has_many :users, through: :user_console_relations
  has_many :boards, through: :board_console_relations
  has_many :posts, through: :post_console_relations
end
