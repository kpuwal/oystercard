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
          expect(subject.fare).to eq Journey::MINIMUM_FARE
        end
      end

      describe '#penalty_fare' do
        it 'has a penalty fare of 6' do
          #subject.end(station_out)
          expect(subject.penalty_fare).to eq 6
        end

        it 'returns penalty fare if there is no entry station' do
          #subject.fresh
          #subject.end(station_out)

          #expect(subject.fare).to eq Journey::PENALTY_FARE
      end
      end	

      describe '#fresh' do
        it 'clears entry station' do
          subject.fresh
          expect(subject.entry_station).to eq nil
      end

      it 'clears exit station' do
          expect(subject.exit_station).to eq nil
        end
      end
end