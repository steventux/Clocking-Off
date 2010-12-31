module CalendarHelper

  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  # custom options for this calendar
  def event_calendar_opts
    {
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "&laquo; #{month_link(@shown_month.prev_month)}",
      :next_month_text => "#{month_link(@shown_month.next_month)} &raquo;",
      :link_to_day_action => "day"
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/events/#{event.id}" title="#{h(event.name)}" data-remote="true">#{h(event.name)} : #{h(event_time(event))}</a>)
    end
  end

  def event_time(event)
    "#{event.start_at.hour}.#{event.start_at.min}-#{event.end_at.hour}.#{event.end_at.min}"
  end

end

# Patched to make remote calls from calendar day links.
#
module EventCalendar
  module CalendarHelper
    def day_link(text, date, day_action)
      link_to(text, params.merge(:action => day_action, :year => date.year, :month => date.month, :day => date.day),
        :class => 'ec-day-link', :remote => true)
    end
  end
end
