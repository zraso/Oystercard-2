require 'oystercard'

describe Oystercard do
  describe '#balance' do
    # context 'balance is 0' do
      it 'displays 0' do
        expect(subject.balance).to eq 0
      end
    # end
      it 'tops up balance with given amount' do
        oyster = Oystercard.new
        oyster.top_up(5)
        expect(oyster.balance).to eq 5
      end

      it 'deducts balance with given amount' do
        oyster = Oystercard.new
        oyster.top_up(10)
        oyster.deduct(5)
        expect(oyster.balance).to eq 5
      end
  end

  describe '#maximum_balance' do
    it 'throws an error if balance is greater than £90' do
      oyster = Oystercard.new
      oyster.top_up(Oystercard::MAX_BALANCE)
      expect { oyster.top_up(1) }.to raise_error "Error: Cannot top up, balance exceeds Maximum Balance £#{Oystercard::MAX_BALANCE}"
    end
  end

  describe 'journey status' do
    it 'it tells us if the user is currently on a journey' do
      oyster = Oystercard.new
      expect(oyster.in_journey?).to eq false
    end

    it 'tells us if the user is currently touched in' do
      oyster = Oystercard.new
      oyster.touch_in
      expect(oyster.in_journey?).to eq true
    end

    it 'tells us if the user is currently touched out' do
      oyster = Oystercard.new
      oyster.touch_out
      expect(oyster.in_journey?).to eq false
    end
  end
end
