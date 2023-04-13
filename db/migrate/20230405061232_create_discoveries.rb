class CreateDiscoveries < ActiveRecord::Migration[6.1]
  def change
    create_table :discoveries do |t|
      t.integer :member_id,null: false
      t.integer :genre_id,null: false
      t.string :title,null: false
      t.string :explanation,null: false
      t.boolean :is_deleted,null: false, default: false
      t.timestamps
    end
  end
end
