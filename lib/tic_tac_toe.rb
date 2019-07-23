class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
      end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
        [1, 4, 7]
        ]
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
        puts "-----------"
    end

    def input_to_index(user_input)
        user_input.to_i-1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end

    def turn
        puts "Please input a number between 1-9"
        user_input = gets.chomp
        index = input_to_index(user_input)
        token = current_player
        if valid_move?(index)
            move(index, token)
            display_board
        else
            turn
        end
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"} 
    end

    def current_player
        if turn_count.even?
            return "X"
        else
            return "O"
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combination|
            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]
            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]
            if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
              return win_combination
            end
          end
          return false
    end

    def full?
     @board.all?{|token| token == "X" || token == "O"}
    end

    def draw?
     !won? && full?
    end

    def over?
        draw? || won?
    end

    def winner
        winner_combo = won?
        if winner_combo
            @board[winner_combo[0]]
        end
    end

    def play 
            turn until over?
            if won?
                winning_token = winner
                puts "Congratulations #{winning_token}!"
            elsif draw? 
                puts "Cat's Game!"
            else  
        end
    end
    




end
