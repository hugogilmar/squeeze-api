class CreateSqueezeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_categories, id: :uuid do |t|
      t.references :budget, foreign_key: { to_table: :squeeze_budgets }, type: :uuid, index: true
      t.string :description
      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0
      t.timestamp :deleted_at, null: true, index: true
      t.timestamps
    end
  end
end
