class RenameNewsletter < ActiveRecord::Migration[5.1]
  def change
    rename_table :newsletters, :newsletter_subscriptions
    rename_column :newsletter_histories, :newsletter_id, :newsletter_subscription_id
  end
end
