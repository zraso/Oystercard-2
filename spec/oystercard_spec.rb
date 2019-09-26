require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { double (:journey) }
  subject(:oyster) { described_class.new(journey) }

  describe '#balance' do
    # context 'balance is 0' do
      it 'displays 0' do
        expect(oyster.balance).to eq 0
      end
    # end
      it 'tops up balance with given amount' do
        oyster.top_up(5)
        expect(oyster.balance).to eq 5
      end

      it 'when touching out, minimum fare is deducted from balance' do
        oyster.top_up(5)
        allow(journey).to receive(:journey_status) { true }
        oyster.touch_in(entry_station)
        oyster.touch_out(exit_station)
        expect(oyster.balance).to eq 4
      end

  end

  describe '#top_up' do
    it 'throws an error if balance is greater than maximum balance' do
      oyster.top_up(Oystercard::MAX_BALANCE)
      expect { oyster.top_up(1) }.to raise_error "Error: Cannot top up, balance exceeds Maximum Balance £#{Oystercard::MAX_BALANCE}"
    end
  end

  describe '#touch_in' do
    it 'throws an error if balance is less than minimum balance' do
      oyster.top_up(0.40)
      expect { oyster.touch_in(entry_station) }.to raise_error "Error: Cannot touch in, your balance is less than minimum balance £#{Oystercard::MIN_BALANCE}"
    end

    it 'tells us if the user is currently touched in' do
      oyster.top_up(5) #min_balance step 9: added this line to pass min_balance test
      allow(journey).to receive(:journey_status) { true }
      oyster.touch_in(entry_station)
      expect(oyster.in_journey?).to eq true
    end
  end

  describe '#touch_out' do
    # it 'tells us if the user is currently touched out' do
    #   oyster.top_up(5)
    #   allow(journey).to receive(:journey_status) { true }
    #   oyster.touch_in(entry_station)
    #   oyster.touch_out(exit_station)
    #   expect(oyster.in_journey?).to eq false
    # end

    # it 'forgets entry station' do
    #   oyster.top_up(5)
    #   allow(journey).to receive(:journey_status) { true }
    #   oyster.touch_in(entry_station)
    #   oyster.touch_out(exit_station)
    #   expect(oyster.entry_station).to eq nil
    # end
  end

  describe '#journey_history' do
    it 'should have an empty journey list by default' do
      expect(oyster.journey_history).to eq []
    end

    it 'checks that touching in and out stores a journey' do
      oyster.top_up(5)
      allow(journey).to receive(:journey_status) { true }
      oyster.touch_in(entry_station)
      allow(journey).to receive(:journey_status) { false }
      oyster.touch_out(exit_station)
        #this is testing state
      expect(oyster.journey_history).to eq [{ entry_station: entry_station, exit_station: exit_station }]
    end
  end

  describe '#in_journey' do
    it 'forwards journey status requests' do
      #syntax to use when you're testing a new extracted class
      #journey - ref double at the top
        expect(journey).to receive (:journey_status) { true }
        oyster.in_journey?
    end
  end
end
