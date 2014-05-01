class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation, :role

  has_many :moves
  belongs_to :game

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :games_as_invitee, class_name: 'Game', foreign_key: 'invitee_id'
  has_many :games_as_challenger, class_name: 'Game', foreign_key: 'challenger_id'

  def role?(role)
    self.role.to_s == role.to_s
  end

  before_save do |user|
    user.role = "user"
  end

end
