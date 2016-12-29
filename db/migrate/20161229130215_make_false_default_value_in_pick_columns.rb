class MakeFalseDefaultValueInPickColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :hands, :tzar_pick, :czar_pick
    reversible do |dir|
      dir.up do
        change_column :hands, :player_pick, :boolean, default: false
        change_column :hands, :czar_pick, :boolean, default: false
      end
      dir.down do
        change_column :hands, :player_pick, :boolean, default: nil
        change_column :hands, :czar_pick, :boolean, default: nil
      end
    end
  end
end
