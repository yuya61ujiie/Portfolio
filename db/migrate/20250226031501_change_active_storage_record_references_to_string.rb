class ChangeActiveStorageRecordReferencesToString < ActiveRecord::Migration[7.2]
  def change
    remove_column :active_storage_attachments, :record_id
    add_column :active_storage_attachments, :record_id, :string, null: false
  end
end
