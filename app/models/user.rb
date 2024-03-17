class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, class_name: 'Prefecture', foreign_key: 'prefecture_id'

  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :nickname, presence: true
end