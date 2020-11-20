class TicTacToe
        
    WIN_COMBINATIONS = [[0,1,2], 
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]]
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

    def input_to_index(string)
        string.to_i - 1
    end

    def move(place, piece)
        @board[place] = piece.upcase
    end

    def position_taken?(place)
        if @board[place] != " "
            true
        else
            false
        end 
    end

    def valid_move?(place)
        if @board[place] == " " && place.between?(0, 8)
            true
        else
            false
        end 
    end

    def turn_count
        @board.count{|place| place != " "}
    end 

    def current_player
        if @board.count{|place| place != " "}.even?
            "X"
        else
            "O"
        end
    end

    def turn
        print "Please, select your space 1-9"#ask for input
        input = gets.strip# get input  
        place = input_to_index(input)# translate input into index  
        if valid_move?(place)# if index is valid   
          piece = current_player
          move(place, piece)#make the move for index\
          display_board
        else# else
            puts "Please make vaild move"
            turn#restart turn
        end
    end# end 

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
              return combo
            end
          end


        # WIN_COMBINATIONS.find do |win_combo|
        #     index_1 = win_combo[0]
        #     pos_2 = win_combo[1]
        #     pos_3 = win_combo[2]

        #     token_1 = @board[index_1]
        #     token_2 = @board[pos_2]
        #     token_3 = @board[pos_3]

        #     token_1 == token_2 == token_3 && token_1 != " "
        # end
            
    end

    def full?
        @board.none? {|position| position == " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw? 
    end

    def winner
        if win_combo = won?
            @board[win_combo[0]]
        end
    end

    def play
        until over? 
            turn
        end
        if draw?
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end
end
