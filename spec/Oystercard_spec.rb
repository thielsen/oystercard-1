require "Oystercard"

describe Oystercard do

  describe '#balance' do

    it { is_expected.to respond_to(:balance) }

    it "should have a default new balance of £0" do
      card = Oystercard.new
      expect(card.balance).to eq 0
    end

  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1) }

    it "should be able to top up the balance" do
      card = Oystercard.new
      card.top_up(10)
      expect(card.balance).to eq 10
    end

    it "should not be able to have a balance over £90" do
      card = Oystercard.new
      card.top_up(80)
      expect { card.top_up(11) }.to raise_error "Maximum balanced is £#{Oystercard::MAXIMUM_BALANCE}"
    end

  end

  describe '#deduct' do

    it { is_expected.to respond_to(:deduct).with(1) }

    it "should be able to deduct an amount from the balance" do
      card = Oystercard.new
      card.top_up(15)
      expect(card.deduct(5)).to eq 10
    end

   end

end
