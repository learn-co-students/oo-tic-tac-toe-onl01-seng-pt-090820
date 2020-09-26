require"pry"

class TicTacToe
    attr_accessor :play

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [2,4,6], # Diagonal 2
        [0,4,8], # Diagonal 1
        [0,3,6], # First column
        [1,4,7], # Middle column
        [2,5,8]  # End column
    ]

    def initialize(board = nil)                 # def initialize
        @board = board || Array.new(9, " ")     #   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end                                         # end


    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(num)
        index = num.to_i - 1
    end

    def move(input, player)
        index = input # Not Needed
        @board[index] = player # Index could of been input
      end

    def position_taken?(index)
       !(@board[index].nil? || @board[index] == " ") # @board[index] != " "
    end

    def valid_move?(num)
        num.between?(0,8) && !position_taken?(num)
    end

    def turn_count
     @board.count("X") + @board.count("O")  # @board.count{|square| square != " " }
    end

    def current_player
        if turn_count.even? # turn_count.even? ? "X" : "O"
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Please Enter Your Move."
        input2 = gets # gets.strip
        input3 = input_to_index(input2)
       if  valid_move?(input3) 
        player = current_player
        move(input3, player)
        display_board # Could Be at end of turn not at end of Valid Move
       else
        self.turn # Self not needed
       end
    end

    def won?
        WIN_COMBINATIONS.each do |combo| # WIN_COMBINATIONS.any? do |combo|
          one = @board[combo[0]]         #     if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          two = @board[combo[1]]         #        return combo
          three = @board[combo[2]]       #     end (3x)    
          if (one == "X" && two == "X" && three == "X") || (one == "O" && two == "O" && three == "O")
            return combo
          end
        end
      return false
    end

    def full?
        !@board.include?(" ") # @board.all?{|square| square != " " }
    end

    def draw?
        if won? == false && full? == true # All could be "full? && !won?"
            return true
        end
    end

    def over?
        won? || draw? ? true : false # ? true : false not needed
    end

    def winner
        if won? == false #if combo = won?
          nil # @board[combo[0]] - thats all you need
        elsif @board[won?[0]] == "X"
          "X"
        else 
          "O"
        end
    end

    def play
        until over? == true # turn until over?
            turn #  puts winner ? "Congratulations #{winner}!" : "Cat's Game!" (All thats needed)
        end
        if draw? == true
            puts "Cat's Game!"
        else won? == true
            puts "Congratulations #{winner}!"
        end
    end

end