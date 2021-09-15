class RemoveDeletedAtFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_index :messages, :deleted_at
    remove_column :messages, :deleted_at, :datetime
  end
end
