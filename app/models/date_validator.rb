class DateValidator < ActiveModel::Validator
  def validate(record)
    if record.due_date < record.start_date || record.start_date < DateTime.now.to_date
      record.errors[:base] << "Invalid dates"
    end
  end
end
