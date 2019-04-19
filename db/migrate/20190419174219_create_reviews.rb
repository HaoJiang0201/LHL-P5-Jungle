class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.refernces :product
      t.refernces :user
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
