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
end
