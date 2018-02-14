class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description

      # friendly_id
      t.string :slug
      t.index :slug, unique: true

      t.string :picture

      t.timestamps
    end

    add_column :products, :category_id, :integer, not_null: true, index: true

    Category.create name: 'Repas'
    Category.create name: 'Musique'
    Category.create name: 'Art'
  end
end
