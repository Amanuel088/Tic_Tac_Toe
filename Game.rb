class Game
  def initialize
    @board = Board.new
    @players = [
      Player.new(setup_player("Player 1", "X"), "X"),
      Player.new(setup_player("Player 2", "O"), "O")
    ]
    @current_player = @players[0]
  end

  def play
    @board.display
    loop do
      take_turn
      @board.display
      if winner?
        puts "🎉 #{@current_player.name} wins!"
        break
      elsif draw?
        puts "It's a draw!"
        break
      end
      switch_player
    end
  end

  private

  def setup_player(default_name, marker)
    print "Enter name for #{default_name} (#{marker}): "
    name = gets.chomp
    name.empty? ? default_name : name
  end

  def take_turn
    position = @current_player.choose_position(@board)
    @board.place_marker(position, @current_player.marker)
  end

  def winner?
    @board.winner?(@current_player.marker)
  end

  def draw?
    @board.full?
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end

# Start the game!
Game.new.play