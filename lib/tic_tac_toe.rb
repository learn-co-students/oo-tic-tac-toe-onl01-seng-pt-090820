require'pry'

class TicTacToe


  WIN_COMBINATIONS = [
    [0,1,2], # top_row 
    [3,4,5], # middle_row 
    [6,7,8], # bottom_row 
    [0,3,6], # left_column 
    [1,4,7], # center_column 
    [2,5,8], # right_column 
    [0,4,8], # left_diagonal 
    [6,4,2] # right_diagonal 
  ]
  
  
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end
  
  
  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(user_input)
    index = user_input.to_i
    return index -1
  end
  
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] != " "
      return true
    else
      return false
    end
  end
  
  
  def valid_move?(index)
    if index < 0 || index > 8
     # binding.pry
      return false
    elsif @board[index] != " "
      return false
    else
      return true
    end
  end
    
    
  def turn_count
    count = 0
    @board.each do |i|
      if i == "X" || i == "O"
      count += 1
    end
  end
      count
  end
    
    
  def current_player
    x_player = "X"
    o_player = "O"
    if turn_count % 2 == 0
      return x_player
    else
      return o_player
    end
  end
       
        
  def turn

    puts "Please choose a move 1 - 9"
    input = gets
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
      else
      turn
    end
  end
  
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] ==           @board[combo[2]] && position_taken?(combo[0])
      return combo
      end
    end
    false
  end
  
  def full?
    #check each element
    @board.each do |space|
      if space == " "
        return false
      end
    end
    return true
  end

  
  def draw?
  !won? && full?
  end
  
  
  def over?
    won? || draw?
  end
  
  
  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
    turn
  end
    if won?
      #binding.pry
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end