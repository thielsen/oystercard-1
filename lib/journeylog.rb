class Journeylog

def initialize(journey_class = Journey.new)
  # Initilize with journey class parameter
  @journey = journey_class
  @travel_history = []
  @journey_WIP = {in: nil, out: nil }
end

def start(entry_station)
  # should start a new journey with an entry station
  @journey.start(entry_station)
end

def finish(exit_station)
  # should add an exit station to current_journey
  @journey.finish(exit_station)
end

def journeys
  # should return list of all previous journeys without exposing internal array to external modification
  @travel_history
end

private

def current_journey
  # should return an incomplete journey or create a new journey
  return false if @journey[:in] != nil && @journey[:out] == nil
  true
  @journey return once filled
end

end
