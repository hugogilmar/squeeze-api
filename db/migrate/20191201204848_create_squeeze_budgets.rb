class CreateSqueezeBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :squeeze_budgets, id: :uuid do |t|
      t.references :user, foreign_key: { to_table: :squeeze_users }, type: :uuid, index: true
      t.string :description
      t.timestamp :deleted_at, null: true, index: true
      t.timestamps
    end
  end
end
