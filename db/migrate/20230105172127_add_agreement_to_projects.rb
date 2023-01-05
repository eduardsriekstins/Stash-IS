class AddAgreementToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :agreement, :binary
  end
end
