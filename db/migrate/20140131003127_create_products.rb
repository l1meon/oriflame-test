class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :title_ro
      t.text :description
      t.text :description_ro
      t.string :image_url
      t.text :about_product
      t.text :about_product_ro
      t.text :ingredients
      t.text :ingredients_ro
      t.integer :category_id
      t.timestamps
    end
  end
end
