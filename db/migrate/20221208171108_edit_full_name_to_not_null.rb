class EditFullNameToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :full_name, :string, null: false
  end
end
