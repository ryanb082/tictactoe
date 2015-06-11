#1. Come Up with Requirements, which determine scope(Product team come's up with)
#2. Logic Flow (Application Logic); sequence of steps
#3. Translation of steps into code
#4. Run codd to verify logic.

# Draw board
# assign Player 'x'
# assign computer 'o'
# Loop until a winner or all squares are taken
# Player1 one picks empyt square
# Check for winnner
# computer two picks empty square
# Check for winnner

#if there's a winner
 #show winner 
#else
	#it's a tie

require 'pry'

def initalize_board
	b = {}
	(1..9).each {|position| b[position] = ' '}
	b
end



def draw_board(b)
	system 'clear'
	puts "#{b[1]} | #{b[2]} | #{b[3]} "
 	puts "----------"
	puts "#{b[4]} | #{b[5]} | #{b[6]} "
	puts "----------"
	puts "#{b[7]} | #{b[8]} | #{b[9]} "
end


def empty_positions(b)
	b.select {|k,v| v == ' '}.keys
end

def player_picks_square(b)
	puts "Pick a square (1 - 9):"
	position = gets.chomp.to_i
	b[position] = 'X'
end


def computer_picks_square(b)
	position = empty_positions(b).sample
	b[position] = 'O'
end

def check_winner(b)
	winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	winning_lines.each do |line|
			if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
				return 'Player'
			elsif b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] == 'O'
				return 'Computer'
			else
				return nil
			end
	end
end



board = initalize_board
draw_board(board)
	


# Loop construct

begin
	player_picks_square(board)
	computer_picks_square(board)
	draw_board(board)
	winner = check_winner(board)
end until winner ||  empty_positions(board).empty?

if winner
 puts	"#{winner} won!"
else
	puts "Its a tie!"
end

