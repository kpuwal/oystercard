
require_relative '../lib/oystercard'

describe 'feature test' do 
	my_card = Oystercard.new
	my_card.balance 
	my_card.top_up(5)
	# my_card.top_up(90)
	fare = 2 
	#my_card.deduct(fare)
	# my_card.entry_station
	# my_card.touch_in
	#my_card.entry_station?
	#my_card.journey_history
	#journey_history[:entry_station] = exit_station
	#station = Station.new
end 