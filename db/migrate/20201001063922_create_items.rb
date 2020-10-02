class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,nill: false 
      t.text :text,nill: false 
      t.integer :category_id,nill: false 
      t.integer :state_id,nill: false 
      t.integer :delivery_charge_id,nill: false 
      t.integer :shipping_place_id,nill: false 
      t.integer :shipping_date_id,nill: false 
      t.integer :price,nill: false 
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
