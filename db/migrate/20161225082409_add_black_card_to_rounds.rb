class AddBlackCardToRounds < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :black_card_id, :integer, null: false
    add_foreign_key :rounds, :cards, column: :black_card_id
  end
end
