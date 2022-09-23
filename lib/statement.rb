class Statement
    def initialize(io = Kernel, transactions)
        @io = io
        @transactions = transactions
    end
    def print
        formatted_string = "date || credit || debit || balance\n"
        @transactions.reverse.each do |record|
            formatted_string << "#{record[:date].day}/#{record[:date].month}/#{record[:date].year} || "
            formatted_string << "#{record[:credit]} || "
            formatted_string << "#{record[:debit]} || "
            formatted_string << "#{record[:balance]}\n"
        end
        @io.puts(formatted_string)
    end
end