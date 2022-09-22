class Account
  def initialize(time = Time)
    @transactions = []
    @balance = 0.0
    @time = time
  end

  def deposit(amount)
    record = {
      date: @time.new,
      credit: amount.to_f,
      debit: 0.0,
      balance: (@balance + amount).to_f
    }
    @balance += amount
    @transactions.push(record)
  end

  def withdraw(amount)
    @time.new
    record = {
      date: @time.new,
      credit: 0.0,
      debit: amount.to_f,
      balance: (@balance - amount).to_f
    }
    @balance -= amount
    @transactions.push(record)
  end

  def transactions
    return @transactions
  end
end