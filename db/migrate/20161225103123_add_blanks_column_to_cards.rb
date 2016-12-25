class AddBlanksColumnToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :blanks, :integer
  end
end
