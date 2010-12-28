class EventValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "This event can't start after it finishes." unless check_event_times(record)
  end

  private
    def check_event_times(record)
      (record.start_at.nil? or record.end_at.nil? ? true : record.start_at < record.end_at)
    end
end
