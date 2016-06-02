#Oystercard file 


class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey_history = {}
  end	

  def top_up(amount)
  	fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
  	@balance += amount
  end   

  def touch_in(station_in)
  	fail "ERROR: Insufficient funds" if @balance < MINIMUM_FARE
	   @entry_station = station_in   	
  end

  def touch_out(station_out)
   
    @balance -= MINIMUM_FARE
    journey_history[@entry_station] = station_out
    @entry_station = nil
    @exit_station = station_out
  end

  private

  def deduct(fare)
  	@balance -= fare
  end


end