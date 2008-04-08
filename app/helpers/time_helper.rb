module TimeHelper
  FORMATS = {
    :long => ':nmonth :day:ordinal :year, :hour12::minute :lmeridian',
    :dmy  => ':day/:amonth/:year'
  }
  
  def format_time(time, format=:long)
    time.eztime(FORMATS[format])    
  end
end