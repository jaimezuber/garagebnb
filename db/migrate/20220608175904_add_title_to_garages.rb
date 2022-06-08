class AddTitleToGarages < ActiveRecord::Migration[6.1]
  def change
    add_column :garages, :title, :string
  end
end
