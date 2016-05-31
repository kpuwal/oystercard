require 'oystercard'

describe Journey do
  subject(:journey) { described_class.new }
  let(:oystercard) {double :oystercard, }
  it "#fare" do

    context "calculates fare if oystercard has checked in and checked out" do

      journey.fare(oystercard)
    end

  end
end
