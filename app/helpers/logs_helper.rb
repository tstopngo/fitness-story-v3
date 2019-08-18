module LogsHelper
  def time_convert(log)
    log.strftime("%A, %b %e, at %l:%M %p")
  end
end
