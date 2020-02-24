class Oystercard
  attr_accessor :balance
  def initialize
    @balance = 0
  end
  def top_up(money)
    fail "Maximum balance is £90" if @balance >= 90
    @balance += money
  end

end
