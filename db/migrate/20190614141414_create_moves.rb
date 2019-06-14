class CreateMoves < ActiveRecord::Migration[4.2]
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :square

      t.timestamps
    end
  end
end
