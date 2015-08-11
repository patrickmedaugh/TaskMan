class DateValidator < ActiveModel::Validator
  def validate(record)
    puts "Here is your record=========\n #{record}"
    if record.due_date < record.start_date
      record.errors[:base] << "Invalid dates"
    end
  end
end
