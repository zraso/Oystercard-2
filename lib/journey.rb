class Journey
  attr_reader :journey_status

  def initialize
    @journey_status = false
  end

  def start
    @journey_status = true
  end

  def finish
    @journey_status = false
  end
end
