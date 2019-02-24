class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.string :name
      t.float :value
      t.integer :quantity

      t.timestamps
    end
  end
end
