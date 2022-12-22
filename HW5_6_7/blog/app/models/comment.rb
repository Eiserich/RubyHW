class Comment < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :article, dependent: :destroy
  has_many :likes, as: :likeable
  validates  :author, :article, presence: true
  validates  :body, presence: true, length: { minimum: 1 }

  enum :status, %i[unpublished published], default: :unpublished

  scope :published_comments, -> { where(status: 'published') }
  scope :unpublished_comments, -> { where(status: 'unpublished') }
  scope :last_ten_comments, -> { last(10) }
end
