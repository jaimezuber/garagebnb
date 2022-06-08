class AddPriceToGarages < ActiveRecord::Migration[6.1]
  def change
    add_column :garages, :price, :integer
  end
end
