class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # Devise can use a lot more of fields, we're gonna keep it simple and use
      # only the following:

      ## Required
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Trackable
      t.integer  :sign_in_count, null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Custom fields, we add a couple more of fields than admin, but only to 
      # make this table a little more robust, only gender will be obligatory
      t.string  :name, null: false
      t.string  :email, null: false
      t.string :gender, limit: 1, null: false
      t.string :phone
      t.text :address

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, %i[uid provider],      unique: true
  end
end
