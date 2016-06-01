class Journey

	attr_reader :journeys

	def initialize
		@journeys = {}
	end

	def start(entry)
		@entry_station = entry
    	in_journey?
	end

	def end(exit)
		journeys[@entry_station.data] = exit.data
		@entry_station = nil
    	in_journey?
	end

	def in_journey?
	    return true if entry_station
	    false
  	end

end