class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :record_image

  attr_accessor :new_category_name # 仮想属性の新しいカテゴリー登録
end