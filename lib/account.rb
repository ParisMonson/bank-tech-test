class Account
  def initialize(time = Time)
    @transactions = []
    @balance = 0.0
    @time = time
  end

  def deposit(amount)
    raise 'Must be positive number' unless amount >= 0

    perform_transaction(amount)
  end

  def withdraw(amount)
    perform_transaction(-amount)
  end

  attr_reader :transactions

  private

  def perform_transaction(amount)
    record = {}
    record[:date] = @time.new
    if amount > 0
      record[:credit] = amount
    else
      record[:debit] = -amount
    end
    @balance += amount
    record[:balance] = @balance.to_f
    @transactions.push(record)
  end
end
