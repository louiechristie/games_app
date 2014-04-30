class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  has_many :moves
  belongs_to :game

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :games_as_invitee, class_name: 'Game', foreign_key: 'invitee_id'
  has_many :games_as_challenger, class_name: 'Game', foreign_key: 'challenger_id'

end
