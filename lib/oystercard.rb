class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  attr_accessor :balance, :MAX_BALANCE

  def initialize(balance = DEFAULT_BALANCE)
    fail "Maximum balance is #{Oystercard::MAX_BALANCE}" if balance > MAX_BALANCE
    @balance = balance
  end

  def top_up(money)
    fail "Maximum balance is #{Oystercard::MAX_BALANCE}" if money + balance > MAX_BALANCE
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
