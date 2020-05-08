class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    render json: @accounts

  end

  def create
    @account = Account.new(account_params)
    if @account.save
      render json: @account
    else
      # render {error: 'Issue creating account'}
    end
  end

  def show
    @account = Account.find(params[:id])
    render json: @account
  end

  def destroy
    @account = Account.find(params[:id])
     @account.destroy
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)

  end
end
