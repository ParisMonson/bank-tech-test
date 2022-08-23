class Account
  def initialize(io = Kernel, time = Time)
    @transactions = []
    @balance = 0.0
    @io = io
    @time = time
  end

  def deposit(amount)
    time = @time.new
    record = {
      date: "#{time.day}/#{time.month}/#{time.year}",
      credit: amount.to_f.to_s,
      debit: '',
      balance: (@balance + amount).to_f.to_s
    }
    @balance += amount
    @transactions.push(record)
  end

  def withdraw(amount)
    time = @time.new
    record = {
      date: "#{time.day}/#{time.month}/#{time.year}",
      credit: '',
      debit: amount.to_f.to_s,
      balance: (@balance - amount).to_f.to_s
    }
    @balance -= amount
    @transactions.push(record)
  end

  def statement
    result_string = "date || credit || debit || balance\n"
    @transactions.reverse.each do |record|
      result_string << "#{record[:date]} || "
      result_string << "#{record[:credit]} || "
      result_string << "#{record[:debit]} || "
      result_string << "#{record[:balance]}\n"
    end
    @io.puts(result_string)
  end
end
