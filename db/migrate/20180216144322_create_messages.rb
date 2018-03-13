class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :status, default:0, not_null: true

      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :reservation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
