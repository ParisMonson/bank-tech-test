class Statement
    def initialize(io = Kernel, transactions)
        @io = io
        @transactions = transactions
    end
    def print
        formatted_string = "date || credit || debit || balance\n"
        @transactions.reverse.each do |record|
            formatted_string << "#{record[:date].day}/#{record[:date].month}/#{record[:date].year} || "

            if record[:credit].nil?
                formatted_string << " || "
            else
                formatted_string << "%0.2f || " % [record[:credit]]
            end
            if record[:debit].nil?
                formatted_string <<  " || "
            else
                formatted_string << "%0.2f || " % [record[:debit]]
            end
            formatted_string << "%0.2f\n" % [record[:balance]]
        end
        @io.puts(formatted_string)
    end
end