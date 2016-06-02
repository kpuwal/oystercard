class Journey

	attr_reader :entry_station, :exit_station, :in_journey

	def initialize
		@entry_station 
		@exit_station
		@in_journey = false
	end

	def start(station_in)
		@entry_station = station_in
		@in_journey = true
	end

	def end(station_out)
		@exit_station = station_out
		@in_journey = false
	end

end