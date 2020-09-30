require 'pry'

class TicTacToe 
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num)
    index = num.to_i
    index -= 1
  end
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] != " " 
  end
  
  def valid_move?(index)
    @board[index] == " " && index.between?(0,8)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Position 1-9?"
    input = gets.chomp
    index = input_to_index(input)
    player_token = current_player
    if valid_move?(index)
      move(index, player_token)
    else 
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|x| x != " "}
  end
  
  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if win = won?
    number = win[0]
    @board[number]
    else
    end
  end
  
  def play
    display_board
    turn until over?
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
  end
end 

  
  
