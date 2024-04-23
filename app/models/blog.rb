class Blog < ApplicationRecord
  belongs_to :user

  validates :blog_title, presence: true
  validates :blog_text, presence: true

end
