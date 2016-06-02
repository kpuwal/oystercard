require 'journey'
require 'oystercard'

describe Journey do

	let(:station_in) {double(:station_in)}
	let(:station_out) {double(:station_out)}

	describe "#start" do

		it "is in a journey" do
			expect(subject.start(station_in)).to eq true
		end

		it "sets start station" do
			subject.start(station_in)
			expect(subject.entry_station).to eq station_in
		end

	end

	describe "#end" do

		it "is not in a journey" do
			expect(subject.end(station_out)).to eq false
		end

		it "sets end station" do
			subject.end(station_out)
			expect(subject.exit_station).to eq station_out
		end

	end

  describe '#fare' do

    it 'returns a minimum fare' do
      subject.start(station_in)
      subject.end(station_out)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

  end

  describe '#penalty_fare' do

    it 'has a penalty fare 6 by default' do
      expect(subject.penalty_fare).to eq 6
    end

    it 'has a penalty fare if journey is not complete' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

  end	

  context 'when given an entry station' do

    # it 'returns penalty fare if there is no exit station' do
    #   expect(subject.fare).to eq Journey::PENALTY_FARE
    # end

  end  

  describe '#complete?' do

    it 'is in a journey when touched in and out' do
      subject.start(station_in)
      subject.end(station_out)
      expect(subject.complete?).to eq true
    end

  end






      
end