class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :created, location: api_v1_transaction_url(@transaction)
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction
     else
      render json: @transaction.errors, status: :unprocessable_entity
     end
  end

  def destroy
    @transaction.destroy
  end

  def extract
    dates = params.require(:dates).split(',')

    statement_transactions = Transaction.where(
      "date >= :start_date AND date <= :end_date",
      {start_date: dates[0], end_date: dates[1]
    })

    previous_period = Transaction.where("date < :start_date", {start_date: dates[0]})
    
    start_balance = previous_period.sum(:debit) - previous_period.sum(:credit)
    end_balance = start_balance + statement_transactions.sum(:debit) - 
      statement_transactions.sum(:credit)

    render json: {
      start_date: dates[0],
      end_date: dates[1],
      start_balance: start_balance,
      end_balance: end_balance,
      statement_transactions: statement_transactions
    }
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :date, :debit, :credit)
  end
end
