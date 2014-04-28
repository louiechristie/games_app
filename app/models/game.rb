class Game < ActiveRecord::Base
  attr_accessible :challenger_id, :invitee_id, :next_turn_id, :score, :winner_id

  has_many :moves
end
