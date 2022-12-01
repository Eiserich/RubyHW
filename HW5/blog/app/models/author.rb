class Author < ApplicationRecord
  has_many :comments
  validates :name, presence: true, uniqueness: true, length: { in: 1..20 }
end
