class CreateHands < ActiveRecord::Migration[5.0]
  def change
    create_table :hands, id: false do |t|
      t.integer :round_id, null: false
      t.integer :player_id, null: false
      t.integer :card_id, null: false
      t.boolean :player_pick, null: false
      t.boolean :tzar_pick, null: false
      t.timestamps
    end

    execute "ALTER TABLE hands ADD PRIMARY KEY (round_id, player_id);"

    add_foreign_key :hands, :rounds
    add_foreign_key :hands, :players
    add_foreign_key :hands, :cards

    add_index :hands, [:round_id, :player_id], unique: true
  end
end
