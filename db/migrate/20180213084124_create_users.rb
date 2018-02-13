class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :firstname
      t.string :lastname

      t.string :picture

      # magic columns for Authlogic
      t.integer :login_count, :integer, null: false, default: 0
      t.integer :failed_login_count, null: false, default: 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      # friendly_id
      t.string :slug


      # from https://github.com/jarrett/authlogic_email_token/blob/master/readme.md
      t.string :new_email
      t.string :email_token
      t.datetime :email_token_updated_at
      # Technically the :activated column isn't necessary. This gem doesn't access it
      # directly. Instead, it calls User#activate, which you must implement.
      # (See below.)
      t.boolean :activated, after: :id, null: false, default: false

      t.string :perishable_token, :string, default: "", null: false


      t.timestamps
    end


    add_index :users, :slug, unique: true
    add_index :users, :perishable_token
    add_index :users, :email, unique: true
  end
end
