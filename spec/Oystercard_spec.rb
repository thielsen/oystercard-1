require "Oystercard"

describe Oystercard do

  describe '#balance' do

    it "have a default new balance of £0" do
      expect(subject.balance).to eq 0
    end

  end

  describe '#top_up' do

    it "be able to top up the balance" do
      expect { subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it "not be able to have a balance over £90" do
      subject.top_up(80)
      expect { subject.top_up(11) }
      .to raise_error "Maximum balanced is £#{Oystercard::MAXIMUM_BALANCE}"
    end

   end

   describe '#touch_in_touch_out' do

     let(:station) { double :station }

     before(:each) do
       @card = subject
       @card.top_up(15)
     end

     it "not be able to touch in if balance under £1" do
       card = Oystercard.new
       expect { card.touch_in(station) }
       .to raise_error "insufficient funds < #{Oystercard::MINIMUM_BALANCE}"
     end

     it "charge the user when touch_out" do
       subject.touch_in(station)
       expect { subject.touch_out(station) }.to change{ subject.balance }
       .by (-Journey::MINIMUM_FARE)
     end

     it "charge the user a penalty fare when touch_out twice" do
       subject.touch_out(station)
       expect { subject.touch_out(station) }.to change{ subject.balance }
       .by (-Journey::PENALTY_FARE)
     end

     it "charge the user a penalty fare when touch_in twice" do
       subject.touch_in(station)
       expect { subject.touch_in(station) }.to change{ subject.balance }
       .by (-Journey::PENALTY_FARE)
     end


     it "see all previous trips" do
       subject.touch_in(station)
       subject.touch_out(station)
       expect(subject.travel_history).not_to be_empty
     end

     it "has an empty travel_history by default" do
      expect(subject.travel_history).to eq []
     end

     it 'doesnt write failed journey on double touch in' do
       subject.touch_in(station)
       subject.touch_in(station)
       subject.touch_out(station)
       expect(subject.travel_history.length).to eq 2
     end

     it 'keeps last touch in on double touch out so fails so fails to apply penalty' do
       subject.touch_in(station)
       subject.touch_out(station)
       expect { subject.touch_out(station) }.to change{ subject.balance }
       .by (-Journey::PENALTY_FARE)
     end

   end
end
