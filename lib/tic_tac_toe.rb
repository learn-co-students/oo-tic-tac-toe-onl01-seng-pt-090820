require 'pry'

class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [2,5,8],
    [1,4,7]
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(position)
    input = position.to_i 
    input -=1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else
      false  
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
  
  def turn_count 
    turn_number = @board.count{|element| element != " "}
    turn_number
  end
    
  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
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
    @board.all?{|place| place == "X" || place == "O"}
  end 
  
  def draw?
    if self.full? && !self.won?
      true
    elsif !self.full? && !self.won?
      false
    elsif self.won?
      false
    end
  end
  
  def over?
    self.won? || self.draw?
  end
  
  def winner 
    if self.won?
      @board[won?[0]]
    end
  end
  
  def play 
    until self.over?
      self.turn
    end
 
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
  
end

   