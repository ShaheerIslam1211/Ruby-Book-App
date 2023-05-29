class Book < ApplicationRecord
  belongs_to :author
  has_many :books_tags
  has_many :tags, through: :books_tags

  has_one_attached :image

  def self.search(search)
    # Title is for the above case, the OB incorrectly had 'name'
    where("title LIKE ?", "%#{search}%")
  end
end
