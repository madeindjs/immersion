class CreateNewsletterHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletter_histories do |t|
      t.belongs_to :newsletter, index: true, foreign_key: true
      t.belongs_to :newsletter_subscription, index: true, foreign_key: true

      t.timestamps
    end
  end
end
