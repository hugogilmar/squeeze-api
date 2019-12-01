class CreateSqueezeAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_accounts do |t|
      t.references :user, foreign_key: { to_table: :squeeze_users }, index: true
      t.string :uuid, length: 36, null: false, index: { unique: true }
      t.integer :kind, default: 0, index: true
      t.string :description
      t.string :reference_number, length: 4, null: false
      t.timestamp :deleted_at, null: true, index: true
      t.timestamps
    end
  end
end
