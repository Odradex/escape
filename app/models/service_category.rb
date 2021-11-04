class ServiceCategory < ApplicationRecord
  has_many :services, dependent: :destroy
end
