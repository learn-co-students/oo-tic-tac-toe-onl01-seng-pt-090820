class TicTacToe
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ] 
  
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
  
  def input_to_index(user_input)
    
    # how do you return this into index of Array
    user_input.to_i - 1
    # user input sees 1-9 program sees position 0-9
    # to_i means string to integer
  end
  
  def
    move(position, char)
    @board[position] = char
  #reference board, what the user inputed by position = either "x or o"
  end
  
  def position_taken?(input_to_index)
  ((@board[input_to_index] == "X" || @board[input_to_index] == "O"))
  end
  #if the board selected index has/occupied by "X or O" return it true else return false
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  # board index meaning its within the board and if position is Not taken then we want to fill it*bang means opposite

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  #refers to board, count the instances of x's and o's that was inputed and valid
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
    #if the turn_count is divisible by 2 and has 0 remainder = "X", otherwise its "O" 
    #playerone turns are even playertwo turns are odd
    #"%" iterary, "?" to make it a true or false statement
  end
  
  def turn
    puts "Press something 1-9"
    #greets
    input = gets.chomp
    # ask for input of user
    index = input_to_index(input)
    # creates new variable within metho which is eq to input_to_index that passes users input
    char = current_player
    # creates new varaible within method for the "current player"
    if valid_move?(index)
      # sets condition if the passed index is a valid move 
      move(index, char)
      # then execute move passing in current player and the index chosen
      display_board
      # display it through the board
    else
      turn
      # return "turn" as a complete turn to
    end
end
  
  def won?
  WIN_COMBINATIONS.detect do |win_combo|
    #detects/check the combinations inside to do nested hashes
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
      # sets the condition, that if the "X" is in said index positions return win combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
       # sets the condition, that if the "O" is in said index positions return win combo
    end
      false 
      # returns false if its a draw or index position is not detected to be one of the winning combinations
    end
end
    # is full return true
    def full? 
      @board.all?{|filled| filled != " "}
      # if filled spaces is !=(not equal to " " means its true else false)
    end

    def draw?
      !(won?) && (full?)
    #bang won returns draw and board is full
    end
    
    def over?
      (won?)||(full?)||(draw?)
      #if conditions are met means its over, either you won, board is full or its a draw
    end
    
    
    def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
      # if condition met return "X" 
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
      #if condition met return "O"
    else
      nil # if draw return nil
    end
  end
end
#similar with win method only we are returning token x or o to the winner not defining what win is, rather if conditions of win is met. return token.

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

# then just create play new game on bin. goddam this is wth!! whew! c.oyam btw