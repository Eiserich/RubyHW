# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  image       :string
#  name        :string
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify
  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [100, 100]
    attachable.variant :normal, resize_and_pad: [340, 340]
  end

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  after_create_commit -> { broadcast_prepend_to 'products', partial: 'products/products' }
  after_update_commit -> { broadcast_replace_to 'products', partial: 'products/products' }
  after_destroy_commit -> { broadcast_remove_to 'products' }
end
