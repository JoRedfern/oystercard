class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE_TO_TOUCH_IN = 1
  MINIMUM_CHARGE = 1
  attr_accessor :balance, :MAX_BALANCE, :in_journey, :MIN_BALANCE_TO_TOUCH_IN, :MINIMUM_CHARGE, :entry_station, :exit_station, :travel_history, :journey

  def initialize(balance = DEFAULT_BALANCE)
    fail "Maximum balance is #{Oystercard::MAX_BALANCE}" if balance > MAX_BALANCE
    @balance = balance
    @travel_history = []
  end

  def top_up(money)
    fail "Maximum balance is #{Oystercard::MAX_BALANCE}" if money + balance > MAX_BALANCE
    @balance += money
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    fail "Balance is below minimum journey price" if balance < MIN_BALANCE_TO_TOUCH_IN
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct
    @entry_station, @exit_station = entry_station, exit_station
    @travel_history.push( {entry_station: entry_station, exit_station: exit_station } )
    @balance
  end

private
  def deduct
    @balance -= MINIMUM_CHARGE
  end

end
