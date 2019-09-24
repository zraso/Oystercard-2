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
  end

  describe '#maximum_balance' do
    it 'throws an error if balance is greater than £90' do
      oyster = Oystercard.new
      oyster.top_up(89)
      expect(oyster.top_up(1)).to raise_error 'Error: Cannot top up, balance exceeds Maximum Balance £90'
    end
  end
end
