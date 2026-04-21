class Board
  def initialize
    @grid = Array.new(9, " ")
  end

  def display
    puts ""
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts "---+---+---"
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts "---+---+---"
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    puts ""
  end

  def place_marker(position, marker)
    @grid[position] = marker
  end

  def cell_taken?(position)
    @grid[position] != " "
  end

  def winner?(marker)
    winning_combos.any? do |combo|
      combo.all? { |i| @grid[i] == marker }
    end
  end

  def full?
    @grid.none? { |cell| cell == " " }
  end

  private

  def winning_combos
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
      [0, 4, 8], [2, 4, 6]             # diagonals
    ]
  end
end