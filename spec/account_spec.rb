require 'account'

RSpec.describe 'Account' do
  it 'initializes' do
    account = Account.new
    expect(account).to be_instance_of(Account)
  end
  it 'prints the correct formatting and values when showing a deposit statement' do
    io_dbl = double :io
    time_object_dbl = double :time
    allow(time_object_dbl).to receive(:day).and_return(22)
    allow(time_object_dbl).to receive(:month).and_return(8)
    allow(time_object_dbl).to receive(:year).and_return(2022)

    time_dbl = double "Time"
    allow(time_dbl).to receive(:new).and_return(time_object_dbl)

    account = Account.new(io_dbl, time_dbl)

    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n22/8/2022 || 1000.0 ||  || 1000.0\n")
    account.deposit(1000)
    account.statement
  end
  it 'prints the correct formatting and values when showing a withdrawal statement' do
    io_dbl = double :io
    time_object_dbl = double :time

    allow(time_object_dbl).to receive(:day).and_return(24)
    allow(time_object_dbl).to receive(:month).and_return(9)
    allow(time_object_dbl).to receive(:year).and_return(2022)

    time_dbl = double "Time"
    allow(time_dbl).to receive(:new).and_return(time_object_dbl)

    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n24/9/2022 ||  || 1000.0 || 0.0\n24/9/2022 || 1000.0 ||  || 1000.0\n")

    account = Account.new(io_dbl, time_dbl)
    account.deposit(1000)
    account.withdraw(1000)
    account.statement
  end
end
