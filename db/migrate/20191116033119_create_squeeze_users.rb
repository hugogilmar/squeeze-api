class CreateSqueezeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_users, id: :uuid do |t|
      t.string :email, length: 120, null: false, index: { unique: true }
      t.string :password_digest
      t.timestamps
    end
  end
end
