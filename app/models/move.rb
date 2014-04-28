class Move < ActiveRecord::Base
  attr_accessible :game_id, :square, :user_id
end
