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
    
    def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
    
    def turn_count 
        # https://apidock.com/ruby/Array/count
        turns = 0
        @board.count { |x| 
        if x != " "
          turns += 1 
        end
        }
    end
    
    def current_player
      turn_count.even? ? "X" : "O"
    end
    
    def turn
      # ask for input
    puts "Please make your move"
      # get input
    input = gets.strip
      # translate input into index
    index = input_to_index(input)
    token = current_player
      # if index is valid
      if valid_move?(index)
      # make the move for index
      move(index, token)
      # show the board
      display_board
      else
      turn
      end
    end
    
    def won?
  WIN_COMBINATIONS.find do |winning_combo|
    if (@board[winning_combo[0]]) == "X" && (@board[winning_combo[1]]) == "X" && (@board[winning_combo[2]]) == "X"
      return winning_combo
    elsif (@board[winning_combo[0]]) == "O" && (@board[winning_combo[1]]) == "O" && (@board[winning_combo[2]]) == "O"
      return winning_combo
    end
      false
  end
end
    
    def full?
      @board.all? { |x| x != " " }
        # What enumberable (other than each, map, or collect) might be helpful here?
    end 
    
    def draw?
      (full?) && !(won?)
    end
    
    def over?
      (won?) || (draw?)
    end
    
    def winner
      WIN_COMBINATIONS.find do |winning_combo|
    if (@board[winning_combo[0]]) == "X" && (@board[winning_combo[1]]) == "X" && (@board[winning_combo[2]]) == "X"
      return "X"
    elsif (@board[winning_combo[0]]) == "O" && (@board[winning_combo[1]]) == "O" && (@board[winning_combo[2]]) == "O"
      return "O"
    end
      false
  end
    end
    
    def play 
      while over? == false
        turn 
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
