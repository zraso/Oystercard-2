class Oystercard

  attr_reader :balance, :entry_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    # @balance = @balance + amount
    raise "Error: Cannot top up, balance exceeds Maximum Balance £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance = @balance + amount
  end

  def in_journey?
    @entry_station
  end

  def touch_in(entry_station)
    raise "Error: Cannot touch in, your balance is less than minimum balance £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    # @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    # @in_journey = false
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance = @balance - amount
  end
  # def balance
  #   @balance
  # end

end
