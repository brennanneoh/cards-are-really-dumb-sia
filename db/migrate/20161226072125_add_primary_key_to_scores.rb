class AddPrimaryKeyToScores < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER TABLE scores DROP CONSTRAINT scores_pkey"
    add_column :scores, :id, :primary_key
  end
end
