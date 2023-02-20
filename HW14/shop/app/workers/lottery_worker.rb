# frozen_string_literal: true

require 'sidekiq-scheduler'

class LotteryWorker
  include Sidekiq::Worker

  def perform
    LotteryWinnerService.new(lottery_winners: 'LotteryWinners').call
  end
end
