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
	
end