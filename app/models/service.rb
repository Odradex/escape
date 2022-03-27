class Service < ApplicationRecord
  enum category: { 'Еда': 1, 'Техника': 2, 'Разное': 3, 'Персонал': 4 }
  has_and_belongs_to_many :reservations
end
