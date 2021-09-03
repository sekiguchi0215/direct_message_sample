class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
