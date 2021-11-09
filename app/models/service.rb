class Service < ApplicationRecord
  belongs_to :category, class_name: 'ServiceCategory', dependent: nil
end
