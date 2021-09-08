class AddAuthenticationTokenToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :authentication_token, :string, limit: 30
    add_index :transactions, :authentication_token, unique: true
  end
end
