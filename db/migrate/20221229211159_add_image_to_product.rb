class AddImageToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :manufacturer, :string
  end
end
