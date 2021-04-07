class Oystercard
  attr_accessor :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "The maximum balance of #{MAX_BALANCE} has been reached" if  max?(amount)
    @balance += amount
  end

  def deduct(deduction)
    @balance -= deduction
  end

  private 

  def max?(amount)
    balance + amount > MAX_BALANCE
  end
end