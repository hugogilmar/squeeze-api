class CreateSqueezeOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_operations, id: :uuid do |t|
      t.references :account, foreign_key: { to_table: :squeeze_accounts }, type: :uuid, index: true
      t.references :operable, polymorphic: true, type: :uuid, index: { name: 'index_squeeze_operation_on_operable_columns' }
      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0
      t.timestamp :deleted_at, null: true, index: true
      t.timestamps
    end
  end
end
