require 'rails_helper'

RSpec.describe Api::V1::TransactionsController do
  let(:user) { FactoryBot.create(:user) }

  context 'Usual user' do
    before do 
      sign_in user

      Transaction.create(name: 'Buy a car', date: '2021-09-08', credit: 50000, user_id: 3)
      Transaction.create(name: 'Buy an apartament', date: '2021-09-08', credit: 100000, user_id: 3)
      Transaction.create(name: 'Buy a boat', date: '2021-08-08', credit: 40000, user_id: 3)
      Transaction.create(name: 'Salary', date: '2021-08-31', debit: 200000, user_id: 3)
      Transaction.create(name: 'Salary', date: '2021-07-31', debit: 200000, user_id: 3)
    end

    it "#extract statement" do
      get :extract, params: { 
        dates: "2021-09-01,2021-09-08",
        user_email: "ceo@example.com", 
        user_token: "1G8_s7P-V-4MGojaKD7a" }

      parsed_body = JSON.parse(response.body)
      
      expect(response.status).to eq(200)
      expect(parsed_body["start_balance"]).to eq(360000)
      expect(parsed_body["end_balance"]).to eq(210000)
    end
  end  
end
