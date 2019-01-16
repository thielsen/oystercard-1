require 'station'

describe Station do
  context "Testing Station class creation" do
    it "Checking the class functionality" do
      station1 = Station.new("Algate", 1)
      expect(station1.name).to eq("Algate")
      expect(station1.zone).to eq 1
    end
  end
end
