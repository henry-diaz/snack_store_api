class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
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

      ## Custom fields (For the admin I kept it simple)
      t.string  :name, null: false
      t.string  :email, null: false

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :admins, :email,                unique: true
    add_index :admins, %i[uid provider],      unique: true
  end
end
