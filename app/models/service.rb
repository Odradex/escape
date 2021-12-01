class Service < ApplicationRecord
  enum category: { Food: 1, Consoles: 2, Miscellaneous: 3, Staff: 4 }
  has_and_belongs_to_many :reservations
end
