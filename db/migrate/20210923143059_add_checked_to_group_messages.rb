class AddCheckedToGroupMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :group_messages, :checked, :boolean, defalut: false, null: false
  end
end
