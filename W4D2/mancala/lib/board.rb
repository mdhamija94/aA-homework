class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    @cups[6], @cups[13] = [], []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0, 13)
    raise "Starting cup is empty" if @cups[start_pos].empty?    
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].count
    @cups[start_pos] = []

    cup_num = start_pos

    until num_stones == 0
      cup_num += 1

      if cup_num == 6
        @cups[6] << :stone if current_player_name == @player1
      elsif cup_num == 13
        @cups[13] << :stone if current_player_name == @player2
      elsif cup_num.between?(0, 5) || cup_num.between?(7, 12)
        @cups[cup_num] << :stone
      elsif cup_num > 13
        cup_num = cup_num % 13
        @cups[cup_num] << :stone
      end

      num_stones -= 1
    end

    render
    
    next_turn(cup_num)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = [ @cups[0], @cups[1], @cups[2], @cups[3], @cups[4], @cups[5] ]
    side2 = [ @cups[7], @cups[8], @cups[9], @cups[10], @cups[11], @cups[12] ]

    return true if side1.all? { |cups| cups.empty? }
    return true if side2.all? { |cups| cups.empty? }

    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      @player1
    elsif @cups[6].length < @cups[13].length
      @player2
    else
      :draw
    end
  end
end
