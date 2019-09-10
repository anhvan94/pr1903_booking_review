class Book < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :title, presence: true
  validates :author, presence: true, length: {maximum: 100}
  validates :conten, presence:true
  has_one_attached :picture


end
