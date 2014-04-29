class Move < ActiveRecord::Base
  attr_accessible :game_id, :square, :user_id

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :square, presence: true

  after_save :check_game_won

  def check_game_won

    if game.winning_game?
      game.winner_id == user_id
    end
    
    game.save

  end

end