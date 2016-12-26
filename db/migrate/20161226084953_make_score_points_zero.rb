class MakeScorePointsZero < ActiveRecord::Migration[5.0]
  def up
    change_column :scores, :points, :integer, default: 0, null: false
  end

  def down
    change_column :scores, :points, :integer, default: nil, null: true
  end
end
