module CommonUtils
  class DateUtils < Date

    def self.valid?(date_string)
      begin
        Date.parse(date_string)
        true
      rescue => e
        false
      end
    end
  end
end
