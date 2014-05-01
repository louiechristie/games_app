class Move < ActiveRecord::Base
  attr_accessible :game_id, :square, :user_id

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :square, presence: true

  validate :game_in_progress
  validate :square_is_empty
  validate :valid_user
  validate :users_turn
  validate :square_in_bounds

  after_save do |move|
    if move.game.against_computer? && game.whose_turn.name = "Computer"
      move.game.computer_move
    end
  end

  def game_in_progress
    errors.add(:game, "is finished") if game&& game.game_is_finished?
  end

  def square_is_empty
  errors.add(:square, "is already played.") if game&& game.board[square]
  end

  def valid_user
    errors.add(:user, "is not a player of the game.") if user != game.challenger && user != game.invitee
  end

  def users_turn
    errors.add(:user, "is not their turn.") if user &&game && user != game.whose_turn
  end

  def square_in_bounds
    errors.add(:square, "is not a valid square.") if game && game.board[square]
  end

end