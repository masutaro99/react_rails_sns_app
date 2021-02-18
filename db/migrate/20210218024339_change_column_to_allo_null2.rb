class ChangeColumnToAlloNull2 < ActiveRecord::Migration[5.2]
  def up
    change_column :messages, :title, :string, null: true # null: trueを明示する必要がある
  end
  def down
    change_column :messages, :content, :string, null: false
  end
end
