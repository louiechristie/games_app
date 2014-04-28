class Game < ActiveRecord::Base
  attr_accessible :challenger_id, :invitee_id, :next_turn_id, :score, :winner_id

  has_many :moves

  belongs_to :games_as_challenger, class_name: 'User'
  belongs_to :games_as_invitee, class_name: 'User'
  belongs_to :games_as_winner, class_name: 'User'
  belongs_to :games_next_turn, class_name: 'User'
end
