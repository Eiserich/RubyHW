# frozen_string_literal: true

class LotteryService
  attr_reader :lottery_winners

  def initialize(lottery_winners)
    @lottery_winners = lottery_winners
  end

  def call
    date_start = DateTime.now
    date_finish = date_start - 1.month

    orders_paid = Order.where(created_at: @date_start..@date_finish).paid
    users = orders_paid.map(&:user).uniq.sample(2)

    users.each do |user|
      NotifierMailer.lottery_winners(user).deliver_later
    end
  end
end
