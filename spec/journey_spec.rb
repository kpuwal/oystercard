require 'journey'

describe Journey do 

	context ':journeys' do
    before(:each) do
      card.top_up(5)
    end

    it 'generates an empty hash' do
      expect(card.journeys).to be_a(Hash)
    end
    context "journey generation" do
      before(:each) do
        card.touch_in(station1)
        card.touch_out(station2)
      end

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
