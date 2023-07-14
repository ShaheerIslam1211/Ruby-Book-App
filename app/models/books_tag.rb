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
class BooksTag < ApplicationRecord
  belongs_to :book
  belongs_to :tag
end
