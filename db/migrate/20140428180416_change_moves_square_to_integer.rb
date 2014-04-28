class ChangeMovesSquareToInteger < ActiveRecord::Migration
  def change
    change_column :moves, :square, :integer
  end
end
