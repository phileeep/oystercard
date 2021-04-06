class Oystercard
  attr_accessor :balance
  attr_reader :max_balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "The maximum balance of #{MAX_BALANCE} has been reached" if  @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(deduction)
    @balance -= deduction
  end

  # private 

  # # def max?
  # #   @balance + amount > @max_balance
  # # end
end