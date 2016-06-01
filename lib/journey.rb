class Journey
  attr_reader :entry_station

  def initialize
    @entry_station
  end

  def start(station)
    @entry_station= station
    @in_journey= true
  end

  def finish(station)
    false
  end

end