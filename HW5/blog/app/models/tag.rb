class Tag < ApplicationRecord
  has_many :article_tags
  has_many :articles, through: :article_tags
  validates :title, presence: true
  validates :title, uniqueness: true
end
