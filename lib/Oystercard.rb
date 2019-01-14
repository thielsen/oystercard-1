class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_accessor :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Maximum balanced is £#{MAXIMUM_BALANCE}" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "insufficient funds < #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
