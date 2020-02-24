class Oystercard
  MAX_BALANCE = 90
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum balance is £90" if money + balance > MAX_BALANCE
    @balance += money
  end

end
