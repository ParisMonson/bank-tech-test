require 'statement'

RSpec.describe 'Statement' do
  it 'initializes' do
    statement = Statement.new([])
    expect(statement).to be_instance_of(Statement)
  end
  it 'formats deposit record' do
    io_dbl = double :io
    time_object_dbl = double :time
    allow(time_object_dbl).to receive(:day).and_return(22)
    allow(time_object_dbl).to receive(:month).and_return(8)
    allow(time_object_dbl).to receive(:year).and_return(2022)

    deposit_record = {
      date: time_object_dbl,
      credit: 1000.0,
      balance: 1000.0
    }
    statement = Statement.new(io_dbl, [deposit_record])
    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n22/08/2022 || 1000.00 ||  || 1000.00\n")
    statement.print
  end
  it 'formats deposit and withdrawl record' do
    io_dbl = double :io
    time_object_dbl = double :time
    allow(time_object_dbl).to receive(:day).and_return(22)
    allow(time_object_dbl).to receive(:month).and_return(8)
    allow(time_object_dbl).to receive(:year).and_return(2022)

    deposit_record = {
      date: time_object_dbl,
      credit: 1000.0,
      balance: 1000.0
    }
    withdrawal_record = {
      date: time_object_dbl,
      debit: 1000.0,
      balance: 0.0
    }

    statement = Statement.new(io_dbl, [deposit_record, withdrawal_record])
    expect(io_dbl).to receive(:puts).with("date || credit || debit || balance\n22/08/2022 ||  || 1000.00 || 0.00\n22/08/2022 || 1000.00 ||  || 1000.00\n")
    statement.print
  end
end
