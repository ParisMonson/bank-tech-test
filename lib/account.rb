class Account
  def initialize(time = Time)
    @transactions = []
    @balance = 0.0
    @time = time
  end

  def deposit(amount)
    record = {}
    record[:date] = @time.new
    record[:credit] = amount
    record[:balance] = (@balance + amount).to_f
    
    @balance += amount
    @transactions.push(record)
  end

  def withdraw(amount)
    record = {}
    record[:date] = @time.new
    record[:debit] = amount
    record[:balance] = (@balance - amount).to_f
  
    @balance -= amount
    @transactions.push(record)
  end

  def transactions
    @transactions
  end
end