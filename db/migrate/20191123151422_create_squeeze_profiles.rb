class CreateSqueezeProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_profiles do |t|
      t.references :user, foreign_key: { to_table: :squeeze_users }, index: true
      t.string :uuid, length: 36, null: false, index: { unique: true }
      t.string :first_name, length: 120, null: false
      t.string :last_name, length: 120, null: false
      t.timestamps
    end
  end
end
