class RemovProductsReferenceToStockItem < ActiveRecord::Migration[7.0]
  def change
    remove_reference :stock_items, :products, foreign_key: true
  end
end
