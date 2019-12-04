class CreateSqueezeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_categories do |t|
      t.references :budget, foreign_key: { to_table: :squeeze_budgets }, index: true
      t.string :uuid, length: 36, null: false, index: { unique: true }
      t.string :description
      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0
      t.timestamp :deleted_at, null: true, index: true
      t.timestamps
    end
  end
end
