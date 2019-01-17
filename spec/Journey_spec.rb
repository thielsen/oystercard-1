require 'Journey'

describe Journey do
let(:entry_station) {double(:entry_station)}
let(:exit_station) {double(:entry_station)}

  it 'confirm a journey is not completed when touching in' do
    expect{ subject.start(:entry_station) }.to change { subject.completed? }.to be false
  end

  it 'confirm a journey is completed after touching out' do
    subject.start(:entry_station)
    expect{ subject.finish(:exit_station) }.to change { subject.completed? }.to be true
  end

  it 'charges minimum fare when a journey is completed' do
    subject.start(:entry_station)
    subject.finish(:exit_station)
    expect(subject.calculate_fare).to eq Journey::MINIMUM_FARE
  end

  it 'charges pernalty fare when a touch in is not followed by a touch out' do
    subject.start(:entry_station)
    expect(subject.calculate_fare).to eq Journey::PENALTY_FARE
  end

  it 'charges pernalty fare when a touch in is not preceded by a touch out' do
    subject.start(:exit_station)
    expect(subject.calculate_fare).to eq Journey::PENALTY_FARE
  end

  it 'calculate the fare' do

  end

  it 'retrun wether or not the journey is complete' do

  end


end
