class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table :games do |t|
      t.integer :challenger_id
      t.integer :invitee_id

      t.timestamps
    end
  end
end
