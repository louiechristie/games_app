class Game < ActiveRecord::Base
  attr_accessible :challenger_id, :invitee_id, :score, :winner_id
  
  has_many :moves
  belongs_to :challenger, class_name: 'User' 
  belongs_to :invitee, class_name: 'User'
  belongs_to :winner, class_name: 'User'

  validates :challenger_id, presence: true
  validates :invitee_id, presence: true


  def make_move(user, square)

    moves.build(user_id: user.id, square: square)

  end

def board
  board = []
  self.moves.each do |move|
    case move.user_id
      when self.challenger_id
        board[move.square] = "x"
      when self.invitee_id
        board[move.square] = "o"
    end
  end

  # puts "#{board[0]}|#{board[1]}|#{board[2]}"
  # puts "#{board[3]}|#{board[4]}|#{board[5]}"
  # puts "#{board[6]}|#{board[7]}|#{board[8]}"
  puts board.inspect
  board
end

def winning_move_positions
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
end

def game_is_finished?
  winning_game? || drawn_game?
end


def drawn_game?
  board.all? && !winning_game?
end


def winning_game?
  !!winning_move_positions.detect do |winning_move|
    board_sub_set = winning_move.map { |square| board[square] }
    board_sub_set.any? && board_sub_set.uniq.size == 1
  end
end

def whose_turn
  return challenger if moves.empty?
  moves.last.user == challenger ? invitee : challenger
end

def one_of_my_players?(user)
  challenger == user || invitee == user
end

#   validate :valid_challenger, if: :there_is_a_challenger_id?


#   private
#   def valid_challenger
#     unless User.exists?(:challenger_id)
#       errors.add(:base, "Players must be valid")
#     end
#   end

#   private
#   def there_is_a_challenger_id?
#     !!challenger_id
#   end
end
