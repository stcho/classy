module ApplicationHelper
  MONTH_NAMES = ['-','Jan.','Feb.','March','April','May','June','July','Aug.','Sept.','Oct.','Nov.','Dec.']  
  
  def nice_date(dt)
    return '-' if dt.nil?
    mi = ' p.m.'
    mi = ' a.m.' if dt.strftime("%p") == 'AM'
    time_str = dt.strftime("%l:%M") + mi
    if time_str == '12:00 p.m.'
      time_str = 'noon'
    elsif time_str == '12:00 a.m.'
      time_str = 'midnight'
    end
    format_str = "%A, " + MONTH_NAMES[dt.month()] + " %d, %Y, " + time_str
    dt.strftime(format_str)
  end
  
  def nice_short_date(dt)
    return '-' if dt.nil?
    format_str = MONTH_NAMES[dt.month()] + " %-d, %Y"
    dt.strftime(format_str)
  end
  
  def title( page_title )
    content_for :title, page_title.to_s
  end

end
