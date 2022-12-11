class Article < ApplicationRecord
  belongs_to :author, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable
  validates :body, presence: true
  validates :title, uniqueness: true, presence: true
end
