class Shift
  attr_reader :key, :offset

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def create_shift
    offset_shift = offset.generate_offset
    key.convert_key.map.with_index do |number, i|
      number + offset_shift[i]
    end
  end
end
