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
class Book < ApplicationRecord
  belongs_to :user
  has_many :books_tags
  has_many :tags, through: :books_tags

  has_one_attached :image

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
