class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :askFrom
      t.references :askTo
      t.boolean :approved, default: false, null: false

      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :askFrom_id
    add_foreign_key :friend_requests, :users, column: :askTo_id
  end
end
