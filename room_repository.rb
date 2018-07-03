require 'csv'
require_relative 'room'

class RoomRepository
  def initialize(csv_file)
    @rooms = []
    @csv_file = csv_file
    load_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
      @next_id = row[:id] + 1
    end
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
  end

  def find_room(id)
    @rooms.find { |room| room.id == id }
  end
end

repo = RoomRepository.new("room.csv")

p repo.find_room(2)
