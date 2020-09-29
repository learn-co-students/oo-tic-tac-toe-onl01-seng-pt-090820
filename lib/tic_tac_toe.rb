class TicTacToe
  attr_reader :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts "------------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end
  
  def position_taken?(index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      false
    else 
      true
    end
  end
  
  def move(input, token = "X")
    if valid_move?(input)
      @board[input] = token
    end
  end
  
  def valid_move?(input)
    unless position_taken?(input) || input < 0 || input > 9 || input == nil
      true 
    else 
      false 
    end
  end 
  
  def turn
    input = gets.chomp
    input = input_to_index(input)
    if valid_move?(input)
      move(input_to_index(input))
    else 
      turn 
    end
  end
  
  def turn_count 
    turns = 0
    @board.each {|item|
      if item == "X" || item == "O"
        turns += 1
      end
    }
    turns
  end 
  
  def current_player
    if turn_count + 1 % 2 == 1 
      "X"
    else 
      "O"
    end
  end
  
  def won? 
    
  end
  
  def full?
    if @board.contain?(" ")
       false
    else 
      true 
    end
  end
  
  def draw?
    if self.full? && !self.won?
      true 
    else 
      false 
    end
  end
  
  
  
  
end