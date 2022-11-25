class TicTacToe
attr_accessor :board

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]
    ]
   def initialize
     @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

# def display_board(board)
#   puts " # | # | # "
#   puts "-----------"
#   puts " # | # | # "
#   puts "-----------"
#   puts " # | # | # "
# end

def input_to_index(user_input)
user_input.to_i - 1
end

 def move(index, marker)
    @board[index] = marker
 end
# def move(board, index, marker)
#  board[index] = marker
# end
   def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
     !position_taken?(index) && (index).between?(0,8)
     end

    def turn
        puts "Please enter a number (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end
    # def turn(board)
    #     user_input = gets.strip
    #   index = input_to_index(user_input)
    #   if valid_move?(board, index)
    #     player_move(board, index, current_player(board))
    #     display_board(board)
    #   else
    #     turn(board)
    #   end
    # end

    def turn_count
        @board.count{|square| square != " " }
    end
    
    def current_player
        turn_count.even? ? "X" : "O"
    end
# def turn_count(board)
#   counter = 0
#   board.each {|space|
#     if space == "X" || space == "O"
#       counter += 1   
#     end
#   }
#   counter
# end
    def turn_count
        @board.count{|square| square != " " }
    end

    # def won?(board)
    # WIN_COMBINATIONS.each do |single_win_combo|
    #     win_index_1 = single_win_combo[0]
    #     win_index_2 = single_win_combo[1]
    #     win_index_3 = single_win_combo[2]
        
    #     position_1 = board[win_index_1]
    #     position_2 = board[win_index_2]
    #     position_3 = board[win_index_3]
    
    #     if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    #     return single_win_combo
    #     end
    # end
    # return false
    # end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
    end

    # def full?(board)
    # if board.any? {|index| index == nil || index == " "}
    #     return false
    # else
    #     return true
    # end
    # end
        def full?
        @board.all?{|square| square != " " }
         end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if combo = won?
            @board[combo[0]]
        end
    end

#     def play(board)
#   counter = 0
#   until counter == 9
#   turn(board)
#   counter += 1
#   end
# end

# def play(board)
#   until over?(board)
#     turn(board) 
#   end
#   if won?(board)
#     winner(board) == "X" || winner(board) == "O"
#     puts "Congratulations #{winner(board)}!"
#   else draw?(board)
#     puts "Cat\'s Game!"
#   end
# end
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end
