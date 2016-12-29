class RemoveUniqueIndexFromHands < ActiveRecord::Migration[5.0]
  def change
    remove_index :hands, [:round_id, :player_id]
  end
end
