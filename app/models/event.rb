class Event < ApplicationRecord
  belongs_to :location

  def start_time_formatted
    DateTimeFormatter.format_date_time start_time, compact: true
  end

  def start_time_formatted_long
    DateTimeFormatter.format_date_time start_time, compact: false
  end

  def end_time_formatted
    DateTimeFormatter.format_date_time end_time, compact: true
  end

  def end_time_formatted_long
    DateTimeFormatter.format_date_time end_time, compact: false
  end
end
