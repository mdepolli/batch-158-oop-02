require 'csv'
require_relative 'patient'
require_relative 'room_repository'

class PatientRepository
  attr_reader :patients

  def initialize(csv_file)
    @patients = []
    @csv_file = csv_file
    @room_repository = RoomRepository.new("room.csv")
    load_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      room_id = row[:room_id].to_i
      row[:room]  = @room_repository.find_room(room_id)
      @patients << Patient.new(row)
      @next_id = row[:id] + 1
    end
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end
end

repo = PatientRepository.new("patients.csv")
p repo.patients

# fernando = Patient.new(name: "Fernando")

# repo.add(fernando)

# puts "DEPOIS:"
# p repo.patients
