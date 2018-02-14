class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :user_id

      # friendly_id
      t.string :slug
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
