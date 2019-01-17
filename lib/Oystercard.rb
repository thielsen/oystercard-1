require_relative 'Journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_accessor :balance, :travel_history

  def initialize
    @balance = 0
    @travel_history = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Maximum balanced is £#{MAXIMUM_BALANCE}" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "insufficient funds < #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    record_travel unless @journey.completed?
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    record_travel
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def record_travel
  deduct(@journey.calculate_fare)
  @travel_history << @journey
  @journey = Journey.new
  end
end
