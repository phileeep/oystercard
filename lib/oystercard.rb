class Oystercard
  attr_accessor :balance
  attr_reader :max_balance
  MAX_BALANCE = 90

  def initialize(max_balance = MAX_BALANCE)
    @balance = 0
    @max_balance = max_balance
  end

  def top_up(amount)
    raise "The maximum balance of #{max_balance} has been reached" if  @balance + amount > @max_balance

    @balance += amount
  end

  private 

  # def max?
  #   @balance + amount > @max_balance
  # end
end