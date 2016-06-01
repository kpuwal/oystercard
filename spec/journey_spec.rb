require 'journey'

describe Journey do
  subject (:journey) { described_class.new }
  let(:station1) { double(:station1, :data => {:monument => 1}) }
  let(:station2) { double(:station2, :data => {:aldgate_east => 2}) }

  describe "#start" do

    it 'sets in_journey to true' do
      expect(journey.start(station1)).to eq true
    end

    it 'sets start station' do
      journey.start(station1)
      expect(journey.entry_station).to eq station1
    end
  end

describe '#finish' do
  
  before(:each) do 
    journey.start(station1)
  end

  it 'sets the journey to be false' do
    expect(journey.finish(station2)).to eq false
  end


end


end

