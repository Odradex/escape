class Event < ApplicationRecord
  has_one :reservation, dependent: :destroy
  belongs_to :organization
end
