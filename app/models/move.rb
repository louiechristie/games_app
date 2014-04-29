class Move < ActiveRecord::Base
  attr_accessible :game_id, :square, :user_id

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :square, presence: true

  after_create :toggle_turn

  private
  def toggle_turn

    if game.winning_move?(user, square)
      game.winner_id == user_id
        
    else
      if user_id == game.challenger_id
        game.next_turn_id = game.invitee_id
      else
        game.next_turn_id == game.challenger_id
      end
    end
    
    game.save

  end

end