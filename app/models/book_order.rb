class BookOrder < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # Add any additional model logic or validations here
  validates :email, presence: true
  validates :book_id, presence: true
  validates :user_id, presence: true
end
