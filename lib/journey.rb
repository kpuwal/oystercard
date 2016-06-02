class Journey

	attr_reader :entry_station, :exit_station, :in_journey, :fare, :penalty_fare

      PENALTY_FARE = 6
      MINIMUM_FARE = 1

	def initialize
		@entry_station
		@exit_station
		@in_journey = false
    @fare = MINIMUM_FARE
    @penalty_fare = PENALTY_FARE
	end

	def start(station_in)
		@entry_station = station_in
		@in_journey = true
	end

	def end(station_out)
		@exit_station = station_out
		@in_journey = false
	end

  def complete?
    return true if @entry_station != nil && @exit_station != nil
  end

  def fare
    if complete?
      @fare
    else
      @penalty_fare
    end
  end

end