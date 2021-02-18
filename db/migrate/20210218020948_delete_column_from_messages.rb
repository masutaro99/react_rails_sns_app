class DeleteColumnFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :messages, :users
    remove_index :messages, :user_id
    remove_column :messages, :user_id, :bigint
  end
end
