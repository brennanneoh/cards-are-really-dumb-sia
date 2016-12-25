class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :game_id, null: false
      t.integer :card_czar, null: false
      t.timestamps
    end

    add_foreign_key :rounds, :games
    add_foreign_key :rounds, :players, column: :card_czar
  end
end
