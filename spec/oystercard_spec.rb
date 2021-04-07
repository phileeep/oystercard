require 'oystercard'

# let (:min_balance) { Oystercard::MIN_BALANCE }
min_balance = Oystercard::MIN_BALANCE

describe Oystercard do 

  context '#initialize' do
    it { is_expected.to respond_to(:balance) }

    it 'has a default value' do
      expect(subject.balance).to eq(0)
    end

     it 'has a maximum balance' do
       expect(Oystercard::MAX_BALANCE).to eq 90
    end

    it 'raises an error when max reached' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "The maximum balance of #{maximum_balance} has been reached"
    end
  end

  context '#topup' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'Can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  context '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'Can deduct an amount from the balance' do
      subject.top_up(20)
      expect {subject.deduct 1 }.to change{ subject.balance }.by -1
    end
  end

  context '#in_journey?' do
    it { is_expected.to respond_to(:in_journey)}

    it 'Shows by default the user is not in a journey' do 
      expect(subject.in_journey).to eq(false)
    end
  end

  context '#touch_in' do 
    it { is_expected.to respond_to(:touch_in)}

    it 'Changes the status of in_journey to true when touched in' do
      subject.top_up(min_balance)
      subject.touch_in
      expect(subject.in_journey).to eq(true)
    end

    it 'Raises an error if balance is less than £1' do
      expect{ subject.touch_in }.to raise_error("Insufficient funds, your balance is less than #{min_balance}")
    end
  end

  context '#touch_out' do
    it { is_expected.to respond_to(:touch_out)}

    it 'Changes the status of in_journey to false when touched out' do 
      subject.top_up(min_balance)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq(false)
    end
  end

end