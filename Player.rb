class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def choose_position(board)
    loop do
      print "#{@name}, enter a position (1-9): "
      position = gets.chomp.to_i - 1  # convert to 0-based index

      if position.between?(0, 8) && !board.cell_taken?(position)
        return position
      else
        puts "Invalid choice! Try again."
      end
    end
  end
end