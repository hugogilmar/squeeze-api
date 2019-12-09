class AddDeletedAtToSqueezeUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :squeeze_users, :deleted_at, :timestamp
    add_index :squeeze_users, :deleted_at
  end
end
