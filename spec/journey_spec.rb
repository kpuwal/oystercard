require 'journey'

describe Journey do 
  subject(:journey) {described_class.new}

  let(:station1) {double(:station1, :data => {:monument => 1})}
  let(:station2) {double(:station2, :data => {:bank => 2})}


  context ':journeys' do
    before(:each) do
      journey.start(station1)
    end

    it 'generates an empty hash' do
      expect(journey.journeys).to be_a(Hash)
    end
    context "journey generation" do

      it 'generates a journey' do
        expect(card.journeys).to eq({station1 => station2})
      end

      it 'generates multiple journeys' do
        3.times do
          card.touch_in(station1)
          card.touch_out(station2)
        end
        expect(card.journeys).to eq({station1 => station2, station1 => station2,
                                     station1 => station2, station1 => station2})
      end
    end
  end
end
