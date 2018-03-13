class CreateNewsletters < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletters do |t|
      t.string :object
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
