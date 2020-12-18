class Game < ApplicationRecord
  has_many :boards
  has_many :posts
end
