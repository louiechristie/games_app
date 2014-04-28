class Game < ActiveRecord::Base
  attr_accessible :challenger_id, :invitee_id, :next_turn_id, :score, :winner_id
  
  has_many :moves
  belongs_to :games_as_challenger, class_name: 'User'
  belongs_to :games_as_invitee, class_name: 'User'
  belongs_to :games_as_winner, class_name: 'User'
  belongs_to :games_next_turn, class_name: 'User'

  validates :challenger_id, presence: true
  validates :invitee_id, presence: true

  # Validate challenger exists
  # validate :valid_challenger, if: Proc.new { |game| game.challenger_id }

  # def valid_challenger
  #   unless User.exists?(:challenger_id)
  #     errors.add(:base, "Players must be valid")
  #   end
  # end

  def make_move(user, square)
    move = moves.build(user_id: user.id, square: square)

    move.user_id = user.id
    move.square = square

    self.moves << move

  end

  def show_moves
    result = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.moves.each do |move|
      case move.user_id
        when self.challenger_id
          result[move.square] = "x"
        when self.invitee_id
          result [move.square] = "o"
      end
    end

    puts "#{result[1]}|#{result[2]}|#{result[3]}"
    puts "-----"
    puts "#{result[4]}|#{result[5]}|#{result[6]}"
    puts "-----"
    puts "#{result[7]}|#{result[8]}|#{result[9]}"
  end

end
