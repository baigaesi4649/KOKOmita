class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id,null: false
      t.integer :discovery_id,null: false
      t.float :review_score,null: false
      t.string :comment,null: false
      t.boolean :is_cleared,null: false, default: false
      t.timestamps
    end
  end
end
