require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new } 
  
  context 'responses' do
    it { is_expected.to respond_to :balance }
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it { is_expected.to respond_to(:touch_in) }
    it { is_expected.to respond_to(:touch_out) }
  end

  context '#top_up' do
    it 'adds 10 to the card' do
      expect(card.top_up(10)).to eq 10
    end

    it 'adds 5 to the card' do
      expect(card.top_up(5)).to eq 5
    end

    it 'adds 5 to a card with 10 already' do
      card.top_up(10)
      expect(card.top_up(5)).to eq 15
    end

    it 'raises an error when a string is input' do
      expect{card.top_up("foo")}.to raise_error("Please input an integer")
    end

    it 'allows money to be added to reach limit' do
      expect{card.top_up(90)}.not_to raise_error
    end

    it 'raises an error when exceeding limit of 90' do
      card.top_up(90)
      expect{card.top_up(1)}.to raise_error("Exceeded limit")
    end
  end

  context '#touch_in' do
    before(:each) do
      card.top_up(5)
    end

    it "sets in_journey? to true" do
      expect(card.touch_in).to eq true
    end

    it "raises an error if balance is insufficient" do
      blank_card = Oystercard.new
      expect{ blank_card.touch_in }.to raise_error("Insufficient funds")
    end
  end

  context '#touch_out' do
    before(:each) do
      card.top_up(5)
    end

    it "sets in_journey? to false" do
      card.touch_in
      expect(card.touch_out).to eq false
    end

    it "deducts 1 from balance" do
      card.touch_in
      expect{ card.touch_out }.to change{ card.balance }.by(-1)
    end
  end

  context ':balance' do
    it "has a balance of 0" do
      card = Oystercard.new
      expect(card.balance).to eq 0
    end
  end

end
