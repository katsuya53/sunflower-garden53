class Category < ApplicationRecord
  has_many :records, dependent: :destroy
  has_one_attached :category_image
end