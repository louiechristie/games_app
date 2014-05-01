class ChangeMovesSquareToInteger < ActiveRecord::Migration
  def change
    ALTER TABLE moves ALTER COLUMN square TYPE integer
  end
end
