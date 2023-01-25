# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_cart_id  (cart_id)
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :line_items

  enum status: { unpaid: 0, paid: 1 }

  def order_price
    sum = 0
    cart.line_item.each do |line_item|
      sum += line_item.price * line_item.quantity
    end
    sum
  end
end
