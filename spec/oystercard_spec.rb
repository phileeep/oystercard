require 'oystercard'

describe Oystercard do 
  
  context '#initialize' do
    it { is_expected.to respond_to(:balance) }

    it 'has a default value' do
      expect(subject.balance).to eq(0)
    end
  end

  context '#topup' do
    it { is_expected.to respond_to(:top_up).with(1).argument}

    it 'Can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end
end