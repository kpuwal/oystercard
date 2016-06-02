class Journey

	attr_reader :entry_station, :exit_station, :in_journey
      PENALTY_FARE= 6
      MINIMUM_FARE = 1

	def initialize
		@entry_station
		@exit_station
		@in_journey = false
              @fare= MINIMUM_FARE
	end

	def start(station_in)
		@entry_station = station_in
		@in_journey = true
	end

	def end(station_out)
		@exit_station = station_out
		@in_journey = false
	end

      def fare
          @fare = MINIMUM_FARE
      end

      def penalty_fare
        if entry_station == nil || exit_station == nil
        @fare= PENALTY_FARE
        else
        @fare
        end
      end

      def fresh
        @entry_station = nil
      end

end