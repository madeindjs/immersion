class CreateNewsletterSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletter_subscriptions do |t|
      t.string :email

      t.string :firstname
      t.string :lastname
      # address
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country
      # informations
      t.string :job
      t.string :phone
      # unsubscription
      t.string :unsubscribe_link
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
