class Account
  def initialize(io = Kernel)
    @transactions = []
    @balance = 0.0
    @io = io
  end

  def deposit(amount)
    time = Time.new
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
    time = Time.new
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
