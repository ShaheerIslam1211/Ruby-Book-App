class Tag < ApplicationRecord
  has_many :books_tags
  has_many :books, through: :books_tags
end
