class Move < ActiveRecord::Base
  attr_accessible :game_id, :square, :user_id

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :square, presence: true

end