class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(journey=Journey.new)
    @balance = 0
    @journey_history = []
    @in_journey = false
    @journey = journey
  end

  def top_up(amount)
    raise "Error: Cannot top up, balance exceeds Maximum Balance £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance = @balance + amount
  end

  def in_journey?
    @journey.journey_status
  end

  def touch_in(entry_station)
    @journey.start
    raise "Error: Cannot touch in, your balance is less than minimum balance £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    add_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish
    add_journey(exit_station)
    deduct(MIN_BALANCE)
  end


  private

  def deduct(amount)
    @balance = @balance - amount
  end

  def add_journey(station)
    return @journey_history.last[:exit_station] = station unless in_journey?
    @journey_history << {entry_station: station, exit_station: nil }
  end

end
