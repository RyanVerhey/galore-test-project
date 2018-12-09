module DateTimeFormatter
  def self.date_time_format(compact: false)
    time_format = "%-l:%M %p %z"

    date_format = compact ? "%-m/%-d/%Y" : "%A, %B %-d, %Y"
    at = compact ? "@" : "at"
    "#{ date_format } #{ at } #{ time_format }"
  end

  def self.format_date_time(time, compact: false)
    time.strftime date_time_format(compact: compact)
  end
end
