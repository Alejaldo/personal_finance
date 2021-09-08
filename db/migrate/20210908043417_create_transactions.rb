class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.datetime :date
      t.integer :debit
      t.integer :credit

      t.timestamps
    end
  end
end
