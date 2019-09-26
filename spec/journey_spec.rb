require 'journey'

describe Journey do

  describe '#in_journey' do
    context 'when not in a journey' do
      it 'knows its not in a journey' do
        # expect([true, false]).to contain(subject.in_journey)
        expect(subject.journey_status).to eq false
      end
    end
  end

  describe '#start' do
    it 'starts a journey' do
      subject.start
      expect(subject.journey_status).to eq true
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      subject.finish
      expect(subject.journey_status).to eq false
    end
  end

  # describe '#fare' do
  #   it 'calculates fare' do
  #
  #   end
  # end



end
