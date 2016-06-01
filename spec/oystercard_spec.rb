#Oystercard test file.
require 'oystercard'

describe Oystercard do	
  subject(:oystercard) {described_class.new}
  let(:station) {double(:station)}	

  describe "Attributes" do

	it "has a default balance of 0" do
      expect(oystercard.balance).to eq 0
 	end

 	it "Each oystercard is initialized as not in journey" do
    expect(oystercard.in_journey?).to be false
  end

  end

  describe "#touch_in tests" do

  it "Will not allow touch_in if balance is less than minimum fare" do
  	expect {oystercard.touch_in(station)}.to raise_error "ERROR: Insufficient funds"
    end
  end	


  describe "Methods" do

  before do 
  	oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
  end

  it "Tops up the balance with the amount passed to top_up" do
  	expect(oystercard.balance).to eq Oystercard::MAXIMUM_BALANCE
  end

  it "Refuses balance over 90" do
  	expect {oystercard.top_up(1)}.to raise_error "ERROR: Balance limit is £ #{Oystercard::MAXIMUM_BALANCE}"
  end

  it "Touches in at the beginning of journey" do
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to be true
  end

  it "Touches out at the end of the journey" do
  	oystercard.touch_in(station)
  	oystercard.touch_out
  	expect(oystercard.in_journey?).to be false
  end

  it "charges card on touch out" do
  	expect {oystercard.touch_out}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_FARE)
  end

  it "Remembers station when touched in" do 
  	oystercard.touch_in(station)
  	expect(oystercard.entry_station).to eq station
  end

  it 'forgets entry_station on touch out' do
  	oystercard.touch_out
  	expect(oystercard.entry_station).to be nil
  end

end
end