class AddCountryToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :country, :string, limit: 2
    add_index :products, :country
  end
end