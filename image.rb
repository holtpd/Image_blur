require 'pry'

class Image
  attr_accessor :image
  def initialize(input_array)
    @image = input_array
  end

  def output_image
    image.each do |row|
      puts row.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
