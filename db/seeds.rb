# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
account_one = Account.create(name: 'checking', balance: 100)
transaction_one = Transaction.create(account_id: 1, amount: 10, kind: 'deposit', date: Date.today, description: 'deposit of $10 today' )
