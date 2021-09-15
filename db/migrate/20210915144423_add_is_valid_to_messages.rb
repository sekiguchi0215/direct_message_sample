class AddIsValidToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :is_valid, :boolean, default: true, null: false
  end
end
