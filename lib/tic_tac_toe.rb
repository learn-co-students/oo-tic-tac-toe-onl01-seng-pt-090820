require 'pry'

class TicTacToe
  
  #Possible winning combinations of TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Right-downward diagonal
    [6,4,2], #Left-upward diagonal
    ]
  
  #Create instance variable for game board
    #9 element array, with base values of a blank space
  def initialize
    @board = Array.new(9, " ")  
  end
  
  #Display current state of game board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #Converts player input string to array-friendly index integer
  def input_to_index(move_index)
    move_index = move_index.to_i - 1
    move_index
  end
  
  #Sets board element of move index to respective player's token
  def move(move_index, player_token = "X")
    @board[move_index] = player_token
  end
  
  #Determines if player's desired move is valid (is space occupied)
  def position_taken?(move_index)
    if @board[move_index] == " "
      false
    else
      true
    end
  end
    
  #Determines if player's desired move is valid 
  #(#position_taken = false and within board boundary)
  def valid_move?(move_index)
    #valid if position is NOT taken
    valid = !self.position_taken?(move_index)
    if valid == true
      if move_index.between?(0,8)
        valid = true
      else
        valid = false
      end
    end
    valid
  end
    
  #Determines number of turns played based on occupied spaces
  def turn_count
    turn_count = 0
    @board.each do |space|
      if space != " "
        turn_count += 1
      end
    end
    turn_count
  end
  
  #Detrmines current player based on #turn_count
  def current_player
    if self.turn_count == 0
      return "X"
    elsif self.turn_count.odd?
      return "O"
    else
      return "X"
    end
  end
  
  #Executes a turn of TicTacToe
  def turn
    current_player = self.current_player
    #Ask the user for, and obtain, their move, a position between 1-9.
    print "#{current_player}, enter your move (1-9): "
    move_index = gets.chomp
    print "\n"
    
    #Translate user input to valid index
    move_index = self.input_to_index(move_index)
    
    #Check if user input is valid move
    valid = false
    while !valid do
      if self.valid_move?(move_index)
        #If valid, make the move and display the board.
        self.move(move_index, current_player)
        self.display_board
        valid = true
      else
      #If invalid, ask for a new move until a valid move is received.
        puts "That is not a valid move."
        print "#{current_player}, enter your move (1-9): "
        move_index = gets.chomp
        print "\n"
        move_index = self.input_to_index(move_index)
      end
    end
  end
  
  #Check if there is a winner (any WIN_COMBINATIONS present on board)
  def won?
    WIN_COMBINATIONS.each do |combination|
      occupied = true
      if @board[combination[0]] == " " || @board[combination[1]] == " " ||
         @board[combination[2]] == " "
        occupied = false
      end
      if occupied
        if @board[combination[0]] == @board[combination[1]] && 
           @board[combination[1]] == @board[combination[2]]
          return combination
        end
      end
    end
    false
  end
  
  #Checks if every board space is occupied
  def full?
    @board.each do |space|
      if space == " "
        return false
      end
    end
    true
  end
  
  #Checks if the game is a draw (board full, no winner)
  def draw?
    if self.full? == true && self.won? == false
      return true
    end
    false
  end
  
  #Checks if game is over (board is full or there is a winner)
  def over?
    if self.draw? == true || self.won? != false
      return true
    end
    false
  end
  
  #Determines the winning player when given a won board
  def winner
    if self.won? != false
      if self.current_player == "X"
        return "O"
      else
        return "X"
      end
    end
  end
  
  #Plays a game of TicTacToe
  def play
    self.display_board
    while !self.over? do
      self.turn
    end
    if self.draw? 
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end
end