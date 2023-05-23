class AddLongitudeToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :longitude, :decimal, precision: 5, scale: 2
  end
end
