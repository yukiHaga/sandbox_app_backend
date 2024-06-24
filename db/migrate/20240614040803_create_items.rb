class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :stock, null: false, default: 0

      t.timestamps
    end
  end
end
