class AddColumnsToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :type, :string
    add_column :cards, :text_type, :string
  end
end
