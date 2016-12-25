class RenameCardCzarColumnInRounds < ActiveRecord::Migration[5.0]
  def change
    rename_column :rounds, :card_czar, :card_czar_id
  end
end
