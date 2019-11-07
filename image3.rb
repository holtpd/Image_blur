require 'pry'

puts "What is your manhattan_distance?"
distance = gets.to_i


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

  def image_blur(distance)
    ones = get_ones
    # loop through each row
    @image.each_with_index do |row, row_index|
      # loop through each column in that row
      row.each_with_index do |col, col_index|
        # loop through ones
        ones.each do |pixel_x, pixel_y|
          #binding.pry
          # determine if manhattan distance on current row, col and one row, col 
           # is within the blur distance
           # if cell is within blur distance, set to 1
          if manhattan_distance(row_index, col_index, pixel_x, pixel_y) <= distance
            #puts "#{row_index}, #{col_index}"
            @image[row_index][col_index] = 1
          end
          


        end
      end
    end
    output_image
    # get_ones.each do |pos|
    #   row = pos[0]
    #   col = pos[1]
    #   @image[row][col -1] = 1 unless col == 0 #left
    #   @image[row][col +1] = 1 unless col == @image[row].count - 1 #right
    #   @image[row -1][col] = 1 unless row == 0 #top
    #   @image[row -1][col] = 1 unless row == @image[row].count + 1 #bottom
    #  # binding.pry
    # end
    
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_plane = (x2 - x1).abs
    vertical_plane = (y2 - y1).abs
    horizontal_plane + vertical_plane
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
image.image_blur(distance)