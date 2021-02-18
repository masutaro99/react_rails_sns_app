class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sender_id, :bigint
    add_foreign_key :messages, :users, column: :sender_id
  end
end
