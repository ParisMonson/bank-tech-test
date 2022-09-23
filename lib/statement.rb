class Statement
    def initialize(io = Kernel, transactions)
        @io = io
        @transactions = transactions
    end
    def print
        formatted_string = "date || credit || debit || balance\n"
        @transactions.reverse.each do |record|
            formatted_string << format_date(record[:date]) + " || "
            if record[:credit].nil?
                formatted_string << " || "
            else
                formatted_string << format_number(record[:credit]) + " || "
            end
            if record[:debit].nil?
                formatted_string <<  " || "
            else
                formatted_string << format_number(record[:debit]) + " || "
            end
            formatted_string << format_number(record[:balance]) + "\n"
        end
        @io.puts(formatted_string)
    end

    private

    def format_date(time_obj)
        "%02d/%02d/#{time_obj.year}" % [time_obj.day, time_obj.month]
    end

    def format_number(amount)
        "%0.2f" % [amount]
    end
end