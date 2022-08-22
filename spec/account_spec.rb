require 'account'

RSpec.describe "Account" do
  it "initializes" do
    account = Account.new
    expect(account).to be_instance_of(Account)
  end
  it "prints the correct formatting and values when showing a deposit statement" do
    io_dbl = double :io

    account = Account.new(io_dbl)
    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n22/8/2022 || 1000.0 ||  || 1000.0\n")
    account.deposit(1000)
    account.show_statement
  end
  it "prints the correct formatting and values when showing a withdrawal statement" do
    io_dbl = double :io

    account = Account.new(io_dbl)
    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n22/8/2022 ||  || 1000.0 || 0.0\n22/8/2022 || 1000.0 ||  || 1000.0\n")
    account.deposit(1000)
    account.withdraw(1000)
    account.show_statement
  end
  
end