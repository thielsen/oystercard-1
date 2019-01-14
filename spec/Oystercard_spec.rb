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

  end
end
