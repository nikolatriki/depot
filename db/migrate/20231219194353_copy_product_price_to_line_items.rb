class CopyProductPriceToLineItems < ActiveRecord::Migration[7.0]
  def up
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    LineItem.all.each do |line_item|
      product = line_item.product
      line_item.update(price: product.price)
    end

    def down
      remove_column :line_items, :price
    end
  end
end
