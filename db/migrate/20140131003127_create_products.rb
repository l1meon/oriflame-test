class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.text :about_product
      t.text :ingredients
      t.integer :category_id
      t.timestamps
    end
  end
end
