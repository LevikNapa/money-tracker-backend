class TransactionsController < ApplicationController

  before_action :set_account

  def index
    @transactions = @account.transactions
    render json: @transactions

  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    if @account.balance_update(@transaction) != 'Your balance is too low'
      @transaction.save
      render json: @transaction
    else
      render {error: 'Your balance is too low'}
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end

  # def destroy
  #   @transaction = Transaction.find(params[:id])
  #    @Transaction.destroy
  # end

  private

  def set_account
     @account = Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:account_id, :amount, :kind, :description, :date)

  end
end
