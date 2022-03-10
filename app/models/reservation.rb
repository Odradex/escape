class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :event
  has_and_belongs_to_many :services
end
