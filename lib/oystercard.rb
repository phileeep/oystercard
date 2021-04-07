class Oystercard
  attr_accessor :balance, :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "The maximum balance of #{MAX_BALANCE} has been reached" if  max?(amount)
    @balance += amount
  end

  def deduct(deduction)
    @balance -= deduction
  end

  def touch_in
    fail "Insufficient funds, your balance is less than #{MIN_BALANCE}" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private 

  def max?(amount)
    balance + amount > MAX_BALANCE
  end
end