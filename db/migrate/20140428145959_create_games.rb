class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :challenger_id
      t.integer :invitee_id
      t.integer :winner_id
      t.integer :score
      t.integer :next_turn_id

      t.timestamps
    end
  end
end
