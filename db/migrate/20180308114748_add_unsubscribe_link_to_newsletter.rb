class AddUnsubscribeLinkToNewsletter < ActiveRecord::Migration[5.1]
  def change
    add_column :newsletters, :unsubscribe_link, :string
  end
end
