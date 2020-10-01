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
  
  def initialize
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
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else 
      true
    end
  end
  
  def move(input, token = "X")
    @board[input] = token
  end
  
  def valid_move?(input)
    if !position_taken?(input) && input > -1 && input < 9 && input != nil
      true 
    else 
      false 
    end
  end 
  
  def turn
    input = input_to_index(gets.chomp)
    token = current_player()
    is_valid_move = valid_move?(input)
    if is_valid_move
      move(input, token)
    else 
      turn
    end
    display_board
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
    if (turn_count + 1) % 2 == 1 
      "X"
    else 
      "O"
    end
  end
  
  def won? 
    won = false
    win_arr = []
    counter = 0
   WIN_COMBINATIONS.each { |item|
     if @board[item[0]] == @board[item[1]] && @board[item[1]] == @board[item[2]] && position_taken?(item[1])
       won = true
       win_arr = WIN_COMBINATIONS[counter]
     end
     counter += 1
   }
  # puts win_arr
   if won 
     win_arr 
   else 
     false 
   end
  end
  
  def full?
    if @board.include?(" ")
       false
    else 
      true 
    end
  end
  
  def draw?
    if full? && !won?
      true 
    elsif full? && won?
      false 
    else
      false 
    end
  end
  
  def over?
    if full? or won?
      true 
    else 
      false 
    end
  end
  
  def winner 
    if won?
      if turn_count % 2 == 1 
        "X" 
      else 
        "O"
      end
    else 
      nil 
    end
  end
  
  def play 
    while over? == false do
      turn
      if draw?
        break
      end
  end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else 
      puts "Cat's Game!"
    end
  end
  
  
  
  
  
end