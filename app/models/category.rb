class Category < ApplicationRecord
  has_many :user_category_relations
  has_many :board_category_relations
  has_many :post_category_relations
  has_many :users, through: :user_category_relations
  has_many :boards, through: :board_category_relations
  has_many :posts, through: :post_category_relations
end
