class TicTacToe
  def initialize(whose_turn="x")
    @turn = whose_turn
    @board = Array.new(3) {Array.new(3)}
    @board.each {|i| i.map!{|j| j = " "}}
  end
  def changeTurn()
    if @turn == "x"
      @turn = "o"
    else
      @turn = "x"
    end
  end
  def to_s
    answer = ""
    answer += "_|"
    ('1'..'3').each {|i| answer += ( i + "|" )}
    answer += "\n"
    (1..3).each  do |i|
      answer += i.to_s
      @board[i-1].each {|value| answer += "|" + value}
      answer += "|\n"
    end
    return answer
  end
  def move(x, y) #the board in memory is actually transposed, but it doesn't matter
    if @board[y - 1][x - 1] == ' '
      @board[y - 1][x - 1] = @turn
      changeTurn
      return true
    else
      return false
    end

  end
  def wins?(symbol)
    return (
        (@board[0][0] == symbol and @board[0][1] == symbol and @board[0][2] == symbol) or
        (@board[1][0] == symbol and @board[1][1] == symbol and @board[1][2] == symbol) or
        (@board[2][0] == symbol and @board[2][1] == symbol and @board[2][2] == symbol) or
        (@board[0][0] == symbol and @board[1][0] == symbol and @board[2][0] == symbol) or
        (@board[0][1] == symbol and @board[1][1] == symbol and @board[2][1] == symbol) or
        (@board[0][2] == symbol and @board[1][2] == symbol and @board[2][2] == symbol) or
        (@board[0][0] == symbol and @board[1][1] == symbol and @board[2][2] == symbol) or
        (@board[2][0] == symbol and @board[1][1] == symbol and @board[0][2] == symbol)
    )
  end
  def whoWins?
    if wins?("x")
      return 'x'
    elsif wins?("o")
      return 'o'
    else
      return nil
    end
  end
end

class Player
  @@imPlaying = "x"
  @@difficulty = 0
  def Player.difficulty=(difficulty = 0) # 0-easy, 1-medium, 2-hard
    @@difficulty = difficulty
  end
  def Player.play (ttt)
    case @@difficulty
    when 0
      until ttt.move(rand((0..3)).floor, rand(0..3).floor)
      end
    when 1
    when 2
      
    end
  end

end

a = TicTacToe.new
(0..8).each do |i|
  if a.whoWins? != nil
    puts a.whoWins? + " wins\n\n\n"
    break
  end
  puts "-------Turn no. #{i}-----------"
  puts a
  puts "Your move: "
  print "X-coordinate: "; x = gets.chomp.to_i
  print "Y-coordinate: "; y = gets.chomp.to_i
  if a.move(x, y)
    puts "Opponent's move: "
    Player.play(a)
    puts a
  else
    puts "Incorrect move"
  end
end

