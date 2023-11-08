class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :customer_id
      t.bigint :post_id

      t.timestamps
    end
  end
end
