class Journey


def initialize
  @journey = {}
end

def start(station)
  @station = station
  record_travel("in")
end

def record_travel(status)
status == "in" ? @journey[in:] = @station
: @journey[:out] = @station
end

def calculate



def completed?


end

end
