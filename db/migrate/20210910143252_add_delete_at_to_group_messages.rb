class AddDeleteAtToGroupMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :group_messages, :deleted_at, :datetime
    add_index :group_messages, :deleted_at
  end
end
