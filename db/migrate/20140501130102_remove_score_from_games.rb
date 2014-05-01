class RemoveScoreFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :score
  end
end
