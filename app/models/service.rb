class Service < ApplicationRecord
  has_one :category, class_name: 'ServiceCategory', dependent: nil
end
