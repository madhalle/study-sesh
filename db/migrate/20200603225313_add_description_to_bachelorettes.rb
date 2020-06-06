class AddDescriptionToBachelorettes < ActiveRecord::Migration[5.2]
  def change
    add_column :bachelorettes, :description, :text

  end
end
