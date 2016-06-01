#Oystercard file 


class Oystercard

  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @user_travelling = false
  end	

  def top_up(amount)
  	fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
  	@balance += amount
  end   

  def in_journey?
  	!!@entry_station
  end

  def touch_in(station)
  	fail "ERROR: Insufficient funds" if @balance < MINIMUM_FARE
	   @entry_station = station   	
    @user_travelling = true
  end

  def touch_out
    @user_travelling = false
    @balance -= MINIMUM_FARE
    @entry_station = nil
  end

  private

  def deduct(fare)
  	@balance -= fare
  end


end