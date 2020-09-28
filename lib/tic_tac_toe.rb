require 'pry'
class TicTacToe
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    def initialize
        board = Array.new(9, " ")
        @board = board
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
        occupied_positions = @board.select {|position| position == "X" || position == "O"}
        occupied_positions.count
    end

    def turn
        puts "Please choose a position (1–9)."
        user_input = gets.chomp
        index = input_to_index(user_input)
        player_token = current_player
        valid_move?(index) ? move(index, player_token) : turn
        display_board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.chomp.to_i - 1
    end

    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def won?
        winning_array = WIN_COMBINATIONS.select do |win_combo_array|
            win_combo_array.all? {|index| @board[index] == "X"} || win_combo_array.all? {|index| @board[index] == "O"}    
        end
        winning_array != [] ? winning_array.flatten : nil
    end

    def full?
        @board.none? {|position| position == " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            winner_index = won?.first
            @board[winner_index]
        end
    end

    def play
        until over? 
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end

    end
end