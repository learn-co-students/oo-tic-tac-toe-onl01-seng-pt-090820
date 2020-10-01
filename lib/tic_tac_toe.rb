require 'pry'
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
    
    def input_to_index(user_string)
      input = 0
      input = user_string.to_i
      
      input - 1
    end
    
     def move(index, token = "X")
       @board[index] = token
     end
    
    def position_taken?(position)
       if @board[position] == " " || @board[position] == "nil"
        false
       else
        true
       end
    end
    
    def valid_move?(position)
      position.to_i.between?(0,8) && !position_taken?(position)
    end
    
    
    
    def turn_count 
        # https://apidock.com/ruby/Array/count
        counter = 0
        @board.each do |token|
          if token == "X" || token == "O"
            counter +=1
          end
        end
        counter
    end
    
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn 
        # some of the methods you've already defined could be helpful here
        
        # ask for input
        puts "Please enter 1-9:"
        # get input
        user_input = gets.strip
        # translate input into index
        index = input_to_index(user_input)
        # if index is valid
        if valid_move?(index)
        # make the move for index
        move(index, current_player)
        display_board
        # else
        else
        # ask for input again - how can we do this w/o repeating ourselves? recursion
        turn
        end
    end 
    
    def won? 
        # hint: use WIN_COMBINATIONS to access elements of the @board array
        # .find might also be helpful here
      WIN_COMBINATIONS.any? do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" &&  @board[combo[2]] == "X"
            return combo
        elsif
          @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return combo
        end
      end
    end
    
    
        # What enumberable (other than each, map, or collect) might be helpful here?
  def full?
    @board.all? do |index| 
      index == "X" || index == "O"
    end
  end

  def draw?
    if full? && !won?
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
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
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