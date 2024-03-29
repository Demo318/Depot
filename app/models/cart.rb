class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    # The #find_by method either finds the object or returns nil.
    # It doesn't crash and burn.
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end
end
