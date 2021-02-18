class AddColumnFromMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :recipient_id, :bigint
    add_foreign_key :messages, :users, column: :recipient_id
  end
end
