class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, class_name: 'Prefecture', foreign_key: 'prefecture_id'
  has_one_attached :image

  validates :prefecture_id, presence: { message: "を選択してください" }, numericality: { other_than: 1, message: "を選択してください" }
  validates :nickname, presence: { message: "を入力してください" }, uniqueness: { message: "はすでに使用されています" }
  validate :password_presence

  private

  def password_presence
    if new_record? && password.blank?
      errors.add(:password, "を入力してください")
    end
  end
end