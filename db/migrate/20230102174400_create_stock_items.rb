class CreateStockItems < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_items do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity_available

      t.timestamps
    end
  end
end
