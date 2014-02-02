class Product < ActiveRecord::Base
  belongs_to :category
  has_many :items
  has_many :orders, through: :items

  validates :title, :description, :image_url, :about_product, :ingredients, :category_id, :price, presence: true
end
