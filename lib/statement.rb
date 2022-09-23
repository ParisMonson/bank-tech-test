class Statement
  def initialize(io = Kernel, transactions)
    @io = io
    @transactions = transactions
  end

  def print
    formatted_string = "date || credit || debit || balance\n"
    @transactions.reverse.each do |record|
      formatted_string << "#{record[:date].day}/#{record[:date].month}/#{record[:date].year} || "

      formatted_string << if record[:credit].nil?
                            ' || '
                          else
                            format('%0.2f || ', record[:credit])
                          end
      formatted_string << if record[:debit].nil?
                            ' || '
                          else
                            format('%0.2f || ', record[:debit])
                          end
      formatted_string << format("%0.2f\n", record[:balance])
    end
    @io.puts(formatted_string)
  end
end
