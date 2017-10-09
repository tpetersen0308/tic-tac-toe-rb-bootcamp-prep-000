# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, current_player = "X")
  board[index] = current_player
end

def valid_move?(board, index)
  index.between(0,8) && !position_taken(board, index)
end




# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]
                    ]
def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    combination.all? do |position|
      board[position] == "X"
    end ||
    combination.all? do |position|
      board[position] == "O"
    end
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif (!full?(board) && won?(board) == false) || won?(board)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  else won?(board)
  end
end
