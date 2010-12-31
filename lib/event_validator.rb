class EventValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "This event must finish after it starts." unless check_event_times(record)
  end

  private
    def check_event_times(record)
      (record.start_at.nil? or record.end_at.nil? ? true : record.start_at < record.end_at)
    end
end
