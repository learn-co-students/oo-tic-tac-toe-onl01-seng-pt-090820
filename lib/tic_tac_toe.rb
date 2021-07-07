
class TicTacToe

  attr_accessor :board, :turn_count

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(num)
     num.to_i - 1
   end

   def move(num,plyr)
     board[num] = plyr
   end

   def position_taken?(index)
     if(board[index] == " ")
       return false
     else
       return true
     end
   end

   def valid_move?(num)
     if (num == 0 || position_taken?(0))
       return true
     elsif (num == (1..8) || position_taken?(num+1))
       return true
     else
       return false
     end
   end

   def turn
     puts "Please input 1-9:"
     val = input_to_index(gets.to_i)
     if (valid_move?(val))
       board[val] = current_player
       display_board
     else
       turn
     end
   end

   def won?
     WIN_COMBINATIONS.each do |ea|
       row1 = ea[0]
       row2 = ea[1]
       row3 = ea[2]

       b1 = board[row1]
       b2 = board[row2]
       b3 = board[row3]
       if (b1 == "X" && b2 == "X" && b3 == "X")
         return ea
       elsif (b1 == "O" && b2 == "O" && b3 == "O")
         return ea
       end
     end
     return false
   end

   def full?
     board.all? {|x| x == "X" || x == "O"}
   end

   def draw?
     if !won? && full?
       return true
     else
       return false
     end
   end

   def over?
     if won? || draw?
       return true
     else
       return false
     end
   end

   def winner
     winarry = []
     winarry = won?
     if winarry == false
       return nil
     else
       if (board[winarry[0]] == "O")
         return "O"
       else
         return "X"
       end
     end
   end


   def play
     until over? == true
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
   end
end
