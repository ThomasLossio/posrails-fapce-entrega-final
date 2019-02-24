class AddSaleItemsToSales < ActiveRecord::Migration[5.2]
  def change
  	add_reference :sale_items, :sale, index: true
  end
end
