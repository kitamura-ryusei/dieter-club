class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references :customer, null: false, type: :bigint, foreign_key: true
      t.references :post, null: false, type: :bigint, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end
  end
end
