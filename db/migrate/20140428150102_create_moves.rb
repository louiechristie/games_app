class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :square

      t.timestamps
    end
  end
end
