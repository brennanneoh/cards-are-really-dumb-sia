class AddManyStacksToGames < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :games, :stacks
    remove_column :games, :stack_id, :integer

    create_join_table :games, :stacks

    add_foreign_key :games_stacks, :games
    add_foreign_key :games_stacks, :stacks
    add_index :games_stacks, [:game_id, :stack_id], unique: true
  end
end
