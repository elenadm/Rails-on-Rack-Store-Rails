class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :buyer
      t.text :address
      t.string :email
    end
  end
end
