class Author < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { in: 1..20 }
end
