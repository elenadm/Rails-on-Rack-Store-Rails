class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :price
    end
  end
end
