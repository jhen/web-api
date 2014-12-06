module ApplicationHelper
  def formatted_date(date, form = "%B %d, %Y")
    date.strftime(form)
  end
end
