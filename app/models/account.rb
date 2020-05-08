class Account < ApplicationRecord
  has_many :transactions
  validates :name, :balance, presence: true

  def balance_update(transaction)
    if transaction.kind == 'deposit'
      self.balance = self.balance + transaction.amount
    elsif transaction.kind == 'withdraw'
      if self.balance >= transaction.amount
      self.balance = self.balance - transaction.amount
      else
       return 'Your balance is too low'
     end
    end
  end
end
