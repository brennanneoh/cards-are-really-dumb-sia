class AddStackToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :stack_id, :integer, null: false
    add_foreign_key :cards, :stacks
  end
end
