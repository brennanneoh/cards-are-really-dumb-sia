class RenameColumnCardToWhiteCardInHand < ActiveRecord::Migration[5.0]
  def change
    rename_column :hands, :card_id, :white_card_id
  end
end
