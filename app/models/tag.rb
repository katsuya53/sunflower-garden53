class Tag < ApplicationRecord
  has_many :post_tag_relations
  has_many :posts, through: :post_tag_relations
  validates :tag_name,  uniqueness: true
  attr_accessor :tag_name2, :tag_name3
end
