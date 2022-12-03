class Comment < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :article, dependent: :destroy
  validates  :body, :author_id, :article_id, presence: true
  validates  :body, presence: true, length: { minimum: 1 }

  enum :status, [ :unpublished, :published ], default: :unpublished

  scope :published_comments, -> { where(status: 'published') }
  scope :unpublished_comments, -> { where(status: 'unpublished') }
end
