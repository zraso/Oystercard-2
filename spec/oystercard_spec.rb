require 'oystercard'

describe Oystercard do
  describe '#balance' do
    context 'balance is 0' do
      it 'displays 0' do
        expect(subject.balance).to eq 0
      end
    end
  end
end