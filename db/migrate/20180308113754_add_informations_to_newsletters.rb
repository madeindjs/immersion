class AddInformationsToNewsletters < ActiveRecord::Migration[5.1]
  def change
    add_column :newsletters, :firstname, :string
    add_column :newsletters, :lastname, :string
    # address
    add_column :newsletters, :address, :string
    add_column :newsletters, :zip_code, :string
    add_column :newsletters, :city, :string
    add_column :newsletters, :country, :string
    # informations
    add_column :newsletters, :job, :string
    add_column :newsletters, :phone, :string

    add_column :newsletters, :deleted_at, :datetime
  end
end
