class CreateSqueezeProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_profiles, id: :uuid do |t|
      t.references :user, foreign_key: { to_table: :squeeze_users }, type: :uuid, index: true
      t.string :first_name, length: 120, null: false
      t.string :last_name, length: 120, null: false
      t.timestamps
    end
  end
end
