class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores, id: false do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :points
      t.timestamps
    end

    execute "ALTER TABLE scores ADD PRIMARY KEY (game_id, player_id);"

    add_foreign_key :scores, :games
    add_foreign_key :scores, :players

    add_index :scores, [:game_id, :player_id], unique: true
  end
end
