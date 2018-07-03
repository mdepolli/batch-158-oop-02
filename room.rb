require_relative "patient"

class Room
  # STATE
  # type
  # size
  # capacity
  # sector
  # number/id
  # patients

  class CapacityReachedError < StandardError; end

  attr_accessor :id, :capacity, :patients

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 2
    @patients = attributes[:patients] || []
  end

  # BEHAVIOR

  def full?
    @patients.length == @capacity
  end

  def add_patient(patient)
    fail CapacityReachedError, "Room is full!" if full?
    patient.room = self
    @patients << patient
  end
end


marcelo = Patient.new(name: "Marcelo")
fernando = Patient.new(name: "Fernando", cured: true, blood_type: "AB")

room_1 = Room.new(capacity: 1)

room_1.add_patient(fernando)

# puts room_1.patients.size
# puts "O quarto do Fernando é: #{fernando.room}"
