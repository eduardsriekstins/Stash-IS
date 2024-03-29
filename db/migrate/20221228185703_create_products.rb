class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :model
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
