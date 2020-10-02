require 'pry'
# tic_tac_toe_starter_code
class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        
    end
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
   
    def input_to_index(input)
      integer = (input.to_i) - 1
    end
    
    def move(index, token = "X")
      @board[index] = token
    end
   
    def position_taken?(index)
      if @board[index] == " "
        false
      else
        true
      end
    end
    
     def valid_move?(index)
    if !index.between?(0, 8) 
      false
    elsif @board[index] == "X" || @board[index] == "O"
      false 
    else
      true
    end
  end

    # def valid_move?(index)
    #   if @board[index] == " "
    #     true
    #   elsif !index.between?(0, 8) 
    #   false
    # else
    #   false
    #   end
    # end
  
    def turn_count
        @board.count { |x| x != " " }
    end
    
    def current_player
      turn_count.even?  ? "X" : "O"
    end
    
def turn
    puts "Please specify a position between 1 and 9."
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    
    if valid_move?(index)
      self.move(index, token)
      self.display_board
    else
      turn
    end
  end 

#     def turn
#       # ask for input
#     puts "Please specify your postion between 1-9."
#       # get input
#     input = gets.strip
#       # translate input into index
#     index = input_to_index(input)
#     token = current_player
#       # if index is valid
#     if valid_move?(index)
#       # make the move for index
#       move(index, token)
#       # show the board
#       display_board
#     else
#       turn
#     end
# end
   
   
    def won?
    WIN_COMBINATIONS.find do |winner_array|
      if @board[winner_array[0]] == "X" && @board[winner_array[1]] == "X" && @board[winner_array[2]] == "X"
        winner_array
      elsif @board[winner_array[0]] == "O" && @board[winner_array[1]] == "O" && @board[winner_array[2]] == "O"
        winner_array
      else 
        false
      end
    end
  end

 
    def full?
       if @board.all?{|place| place != " "}
      true
       else
        false
           # What enumberable (other than each, map, or collect) might be helpful here?
       end
    end

    def draw?
      full? && !won?
    end  
    
    def over?
      draw? || won?
    end
    
    def winner
    if won?
   # binding.pry
    @board[won?[2]]
    #access won? is giving array
      end
    end

    def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
      end
# congratulate the winner 
# else if the game was a draw
# # tell the players it ended in a draw
# # end
    end


end