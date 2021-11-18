class TimeValidator < ActiveModel::Validator
  def validate(record)

    return unless record.start_time < record.end_time

    record.errors.add :name, 'Start time must be greater than end time.'
  end
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :event
end
