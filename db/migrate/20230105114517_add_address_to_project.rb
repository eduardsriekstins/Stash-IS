class AddAddressToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :address, :string
  end
end
