require 'account'

RSpec.describe "Account" do
  it "initializes" do
    account = Account.new
    expect(account).to be_instance_of(Account)
  end
  it "returns the correct formatting when showing_statement" do
    io_dbl = double :io

    account = Account.new(io_dbl)
    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n22/8/2022 || 1000.0 ||  || 1000.0\n")
    account.deposit(1000)
    account.show_statement
    # expect(account.show_statement).to eq("date || credit || debit || balance\n22/8/2022 || 1000.0 ||  || 1000.0\n")
  end
  
end