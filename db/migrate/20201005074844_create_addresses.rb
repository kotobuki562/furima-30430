class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_coade,nill: false
      t.integer :prefectures_id,nill: false
      t.string :municipality,nill: false
      t.string :address,nill: false
      t.string :tellphone_number,nill: false
      t.string :building
      t.references :purchase,nill: false, foreign_key: true 

      t.timestamps
    end
  end
end
