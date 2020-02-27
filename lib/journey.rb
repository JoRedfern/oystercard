class Journey

  PENALTY_FARE = 6

attr_reader :entry_station, :exit_station

def initialize(entry_station: nil)
  @entry_station = entry_station
  @complete = false
end


def complete?
  @complete
end

def fare
  PENALTY_FARE
end

def finish(station = nil)
  @exit_station = station
  @complete = false
  self
end

end
