class RemoveNextTurnIdFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :next_turn_id
  end
end
