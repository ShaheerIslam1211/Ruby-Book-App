# frozen_string_literal: true

class BookOrder < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # Add any additional model logic or validations here
  validates :email, presence: true
end
