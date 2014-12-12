class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.string :title
      t.text :body
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
