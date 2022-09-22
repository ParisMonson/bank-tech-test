require 'account'

RSpec.describe 'Account' do
  it 'initializes' do
    account = Account.new
    expect(account).to be_instance_of(Account)
  end

  # Deposit Record
  it 'returns a deposit record with the correct values' do
    time_object_dbl = double :time
    time_dbl = double "Time"
    allow(time_dbl).to receive(:new).and_return(time_object_dbl)

    account = Account.new(time_dbl)
    account.deposit(1000)

    transactions = account.transactions
    expect(transactions[0][:date]).to eq(time_object_dbl)
    expect(transactions[0][:credit]).to eq(1000.0)
    expect(transactions[0][:debit]).to eq(0.0)
    expect(transactions[0][:balance]).to eq(1000.0)
  end
  it 'returns a deposit record with the correct value when a float is given' do
    time_object_dbl = double :time
    time_dbl = double "Time"
    allow(time_dbl).to receive(:new).and_return(time_object_dbl)

    account = Account.new(time_dbl)
    account.deposit(1000.00)
    transactions = account.transactions

    expect(transactions[0][:date]).to eq(time_object_dbl)
    expect(transactions[0][:credit]).to eq(1000.0)
    expect(transactions[0][:debit]).to eq(0.0)
    expect(transactions[0][:balance]).to eq(1000.0)
  end

  # Withdrawal Record
  it 'returns deposit and withdrawal records with the correct values' do
    time_object_dbl = double :time
    time_dbl = double "Time"
    allow(time_dbl).to receive(:new).and_return(time_object_dbl)

    account = Account.new(time_dbl)
    account.deposit(1000)
    account.withdraw(1000)
    transactions = account.transactions

    expect(transactions[0][:date]).to eq(time_object_dbl)
    expect(transactions[0][:credit]).to eq(1000.0)
    expect(transactions[0][:debit]).to eq(0.0)
    expect(transactions[0][:balance]).to eq(1000.0)

    expect(transactions[1][:date]).to eq(time_object_dbl)
    expect(transactions[1][:credit]).to eq(0.0)
    expect(transactions[1][:debit]).to eq(1000.0)
    expect(transactions[1][:balance]).to eq(0.0)
  end
end
