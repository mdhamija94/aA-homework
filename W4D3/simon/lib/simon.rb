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
    @sequence_length += 1
    self.round_success_message if !@game_over 
  end

  def show_sequence
    self.add_random_color

    puts self.seq

    sleep(2)
    system("clear")
  end

  def require_sequence
    puts "Repeat the sequence in order!"
    puts "Input one color on each line:"

    self.sequence_length.times do 
      i = 0

      user_color = gets.chomp

      if user_color != self.seq[i]
        @game_over = true
      end

      i += 1
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