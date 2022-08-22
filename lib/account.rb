class Account
  def initialize(io = Kernel)
    @transactions = []
    @balance = 0.0
    @io = io 
  end 

  def deposit(amount)
    time = Time.new
    record = {
      :date => "#{time.day}/#{time.month}/#{time.year}",
      :credit => amount.to_f.to_s,
      :debit => "",
      :balance => (@balance + amount).to_f.to_s
    }
    @balance += amount
    @transactions.push(record)
  end

  def withraw(amount)
    return nil
  end

  def show_statement
    result_string = "date || credit || debit || balance\n"
    @transactions.each { |record|
      result_string << record[:date] + " || "
      result_string << record[:credit] + " || "
      result_string << record[:debit] + " || "
      result_string << record[:balance] + "\n"
    }
    @io.puts(result_string)
  end
end
account = Account.new