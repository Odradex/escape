class TimeValidator < ActiveModel::Validator
  def validate(record)
  
    return unless record.start_time < record.end_time

    record.errors.add :name, 'Start time must be greater than end time.'
  end
end

class Reservation < ApplicationRecord
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  belongs_to :user
  belongs_to :room

  before_validation :update_end_time
  validates_with TimeValidator

  def update_end_time
    new_time = self.start_time.change(
      hour: end_time.hour,
      min: end_time.min
    )
    self.end_time = new_time
    logger.info "STATS: #{inspect}"
    self.end_time
  end

end
