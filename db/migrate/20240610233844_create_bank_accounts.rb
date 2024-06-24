class CreateBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.integer :balance, null: false, default: 0

      t.timestamps
    end
  end
end
