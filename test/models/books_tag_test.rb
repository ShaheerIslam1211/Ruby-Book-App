# == Schema Information
#
# Table name: books_tags
#
#  id         :bigint           not null, primary key
#  book_id    :bigint           not null
#  tag_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BooksTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
