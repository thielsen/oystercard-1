class Oystercard
  MAXIMUM_BALANCE = 90
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balanced is £#{MAXIMUM_BALANCE}" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
