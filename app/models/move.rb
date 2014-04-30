class Move < ActiveRecord::Base
  attr_accessible :game_id, :square, :user_id

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :square, presence: true

  # is game finished
  validate :game_in_progress
  validate :square_is_empty

  # is user_id a player of the game

  # is user_id is it their turn

  def square_is_empty
  errors.add(:square, "is already played.") if game&& game.board[square]
  end


  # is square within bounds

  def game_in_progress
    errors.add(:game, "is finished") if game&& game.game_is_finished?
  end

end