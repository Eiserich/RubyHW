# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_item, dependent: :nullify
  has_one :order

  def add_product(product)
    line_item.create(product: product, quantity: 1, price: product.price)
  end

  def total_price
    line_item.sum(&:line_item_total_price)
  end
end
