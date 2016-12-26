class AddStackToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :stack_id, :integer, null: false
    add_foreign_key :games, :stacks
  end
end
