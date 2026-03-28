class AddMinimumStockInProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :minimum_stock, :integer
  end
end
