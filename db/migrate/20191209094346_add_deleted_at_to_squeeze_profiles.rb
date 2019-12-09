class AddDeletedAtToSqueezeProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :squeeze_profiles, :deleted_at, :timestamp
    add_index :squeeze_profiles, :deleted_at
  end
end
