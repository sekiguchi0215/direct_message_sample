class RemoveDeletedAtFromGroupMessages < ActiveRecord::Migration[6.1]
  def change
    remove_index :group_messages, :deleted_at
    remove_column :group_messages, :deleted_at, :datetime
  end
end
