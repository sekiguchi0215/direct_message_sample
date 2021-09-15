class AddIsValidToGroupMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :group_messages, :is_valid, :boolean, default: true, null: false
  end
end
