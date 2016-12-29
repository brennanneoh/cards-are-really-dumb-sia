class ChangePrimaryKeyToIdInHands < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        execute "ALTER TABLE hands DROP CONSTRAINT hands_pkey"
        add_column :hands, :id, :primary_key
      end
      dir.down do
        execute "ALTER TABLE hands DROP CONSTRAINT hands_pkey"
        execute "ALTER TABLE hands ADD PRIMARY KEY (round_id, player_id);"
      end
    end
  end
end
