class AddScheduledForColumnsOnSqueezeExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :squeeze_expenses, :scheduled_for, :timestamp
    add_column :squeeze_expenses, :meta, :text
  end
end
