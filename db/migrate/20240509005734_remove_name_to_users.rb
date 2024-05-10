class RemoveNameToUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :name
  end

  def down
    add_column :users, :name, :string, null: false
  end
end
