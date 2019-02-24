class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :consumer_name

      t.timestamps
    end
  end
end
