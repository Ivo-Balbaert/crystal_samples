# ??? not tested !!!
class Email

    getter :subject, :date, :from

    def initialize(subject, options = {} of Symbol => String)
        @subject = subject
        @date = options.fetch(:date, "")
        @from = options.fetch(:from, "")
    end

    def to_s(io : IO)
        io << "Date:     #{date}\n
               From:     #{from}\n
               Subject: #{subject}\n\n"
    end

end