require 'oystercard'

describe Oystercard do 
  
  it { is_expected.to respond_to(:balance) }

  it 'has a default value' do
    expect(subject.balance).to eq(0)
  end
end