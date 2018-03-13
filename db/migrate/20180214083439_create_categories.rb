class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.string :description

      # friendly_id
      t.string :slug
      t.index :slug, unique: true

      t.string :picture

      t.timestamps
    end

    add_reference :products, :category, foreign_key: true

    Category.create name: 'Repas'
    Category.create name: 'Musique'
    Category.create name: 'Art'
  end
end
