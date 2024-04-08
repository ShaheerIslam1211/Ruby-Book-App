# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  title          :string
#  description    :string
#  image          :string
#  published      :string
#  author_id      :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price          :decimal(, )
#  published_date :date
#  genre          :string
#  publisher      :string
#  language       :string
#  isbn           :string
#
require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
