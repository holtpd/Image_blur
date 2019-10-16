class Image
  attr_accessor :image
    def initialize(input_array)
      @image = input_array
    end
  
    def output_image
      image.each do |row|
      puts row.join
    end

    def get_ones(position=1)
      position.times do
        image_blur
      end

    def get_ones
      image_blur = []
      @image.each do |row, position|
        row.each do |x, row_position|
          get_ones << [i, row_position] if x == 1
        end
      end
    end
      def image_blur
        image_blur.each do |pos|
        @image[pos[0]][pos[1] + 1] = 1 if pos[1] + 1 <= @image[pos[0]].length - 1
        @image[pos[0]][pos[1] - 1] = 1 if pos[1] - 1 >= 0
        @image[pos[0] + 1][pos[1]] = 1 if pos[0] + 1 <= @image.length - 1
        @image[pos[0] - 1][pos[1]] = 1 if pos[0] - 1 >= 0
      end
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])

image.output_image
image.image_blur