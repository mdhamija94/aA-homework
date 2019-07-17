class Simon
  COLORS = ["red", "blue", "green", "yellow"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over
      self.round_success_message 
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color

    puts self.seq

    sleep(2)
    system("clear")
  end

  def require_sequence
    puts "Repeat the sequence in order!"
    puts "Input first letter of color in the sequence on each line:"

    self.seq.each_with_index do |color|
      user_color = gets.chomp
      if user_color[0] != color[0]
        @game_over = true
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nailed it! Get ready for the next round."
  end

  def game_over_message
    puts "Bummer, wrong sequence! Game over."
  end

  def reset_game
    self.game_over = false
    self.sequence_length = 1
    self.seq = []
  end
end

game = Simon.new
game.play