class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest

  has_many :moves
  belongs_to :game

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :games_as_winner, class_name: 'Game', foreign_key: 'winner_id'
  has_many :games_as_invitee, class_name: 'Game', foreign_key: 'invitee_id'
  has_many :games_as_challenger, class_name: 'Game', foreign_key: 'challenger_id'

end
