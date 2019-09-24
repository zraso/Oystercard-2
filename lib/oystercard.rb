class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    # @balance = @balance + amount
    raise 'Error: Cannot top up, balance exceeds Maximum Balance £90' if @balance >= 90
    @balance = @balance + amount
    p @balance
  end

  # def balance
  #   @balance
  # end

end
