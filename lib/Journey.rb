class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6


  def initialize
    @journey = {in: nil, out: nil }
  end

  def start(station)
    @journey[:in] = station
  end

  def finish(station)
    @journey[:out] = station
  end

  def calculate_fare
    return PENALTY_FARE if @journey.value?(nil)
    MINIMUM_FARE
  end


  def completed?
      return false if @journey[:in] != nil && @journey[:out] == nil
      true
  end

end
