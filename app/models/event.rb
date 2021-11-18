class Event < ApplicationRecord
  has_one :reservation, dependent: :destroy
end
