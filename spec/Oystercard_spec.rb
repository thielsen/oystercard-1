require "Oystercard"

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  it "should have a default new balance of £0" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

end
