class Oystercard
  attr_accessor :balance, :in_journey, :entry_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def in_journey?
    @entry_station == nil ? false : true
  end

  def top_up(amount)
    raise "The maximum balance of #{MAX_BALANCE} has been reached" if  max?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds, your balance is less than #{MIN_FARE}" if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out
    @balance -= MIN_FARE
    @entry_station = nil
  end

  private 

  def deduct(deduction)
    @balance -= deduction
  end

  def max?(amount)
    balance + amount > MAX_BALANCE
  end
end