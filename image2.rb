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

  def get_ones
    ones = []
    @image.each_with_index do |row, row_index|

      row.each_with_index do |col, col_index|
        ones << [row_index, col_index] if col == 1
        # puts "#{[row_index, col_index]} - I'm a 1" if col.eql? 1
      end
    end

    return ones

  end

  def image_blur
    get_ones.each do |pos|
      row = pos[0]
      col = pos[1]
      @image[row][col -1] = 1 unless col == 0 #left
      @image[row][col +1] = 1 unless col == @image[row].count - 1 #right
      @image[row -1][col] = 1 unless row == 0 #top
      @image[row +1][col] = 1 unless row == @image[row].count + 1 #bottom
    end
     output_image
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])

image.output_image
puts
image.image_blur
