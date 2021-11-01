class TimeValidator < ActiveModel::Validator
  def validate(record)
    return unless record.start_time < record.end_time

    record.errors.add :name, 'Start time must be greater than end time.'
  end
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_with TimeValidator
  before_validation :update_date_in_end_time

  def update_date_in_end_time
    start_time = self.start_time
    self.end_time.change(
      year: start_time.year,
      mouth: start_time.month,
      day: start_time.day
    )
  end
end
