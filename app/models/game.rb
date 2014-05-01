class Game < ActiveRecord::Base
  attr_accessible :challenger_id, :invitee_id, :score
  
  has_many :moves
  belongs_to :challenger, class_name: 'User' 
  belongs_to :invitee, class_name: 'User'

  validates :challenger_id, presence: true
  validates :invitee_id, presence: true
  
  validate :valid_challenger
  validate :valid_invitee

  def score(user)

    return 0 unless game_is_finished?
    return 50 if drawn_game?
    if winning_game?
      return 100 if user == last_turn
      return 0 if user != last_turn
    end
  end

  def board
    board = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    self.moves.each do |move|
      case move.user_id
        when self.challenger_id
          board[move.square] = "x"
        when self.invitee_id
          board[move.square] = "o"
      end
    end

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

  def last_turn
    return nil if moves.empty?
    return moves.last.user
  end

  def one_of_my_players?(user)
    challenger == user || invitee == user
  end

  private
  def valid_challenger
    errors.add(:challenger_id, "is not valid") if !User.find(challenger_id)
  end

  private
  def valid_invitee
    errors.add(:invitee_id, "is not a valid") if !User.find(invitee_id)
    errors.add(:invitee_id, "cannot be the same as challenger") if challenger_id == invitee_id
  end


end
