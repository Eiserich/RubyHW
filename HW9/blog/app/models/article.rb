class Article < ApplicationRecord
  belongs_to :author, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable
  validates :body, presence: true
  validates :title, uniqueness: true, presence: true

  scope :search_title_and_body, ->(phrase) { where('title || body ILIKE ?', "%#{phrase}%") }
  scope :filter_by_author, ->(author_is) { joins(:author).where('name ILIKE ?', "%#{author_is}") }
  scope :filter_by_tag, ->(tag_is) { joins(:tags).where('name ILIKE ?', "%#{tag_is}%") }
  scope :sort_title_by_asc_desc, ->(order = 'asc') { order(title: order) }
end
