class CreateNewsletterHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletter_histories do |t|
      t.integer :newsletter_id
      t.integer :newsletter_subscription_id
      t.string :method

      t.timestamps
    end
  end
end
