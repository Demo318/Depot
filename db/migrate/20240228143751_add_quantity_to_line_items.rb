class AddQuantityToLineItems < ActiveRecord::Migration[7.1]
  def change
    # Default of 1 to help existing carts in the database.
    add_column :line_items, :quantity, :integer, default: 1
  end
end
