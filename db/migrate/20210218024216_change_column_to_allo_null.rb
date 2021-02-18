class ChangeColumnToAlloNull < ActiveRecord::Migration[5.2]
  def up
    change_column :messages, :content, :string, null: true # null: trueを明示する必要がある
  end
end
