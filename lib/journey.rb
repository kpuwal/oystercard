class Journey

  attr_reader :journeys, :entry_station, :exit_station

  def initialize
    @journeys = {}
  end

  def start(entry)
    @entry_station = entry
    in_journey?
  end

  def end(exit)
    @exit_station = exit
    fare
    finish
    journeys[@entry_station.data] = exit.data
    @entry_station = nil
      in_journey?
  end

  def fare
    
  end

  def finish

  end

  def complete?

  end

  def in_journey?
    return true if entry_station
    false
  end

end
