class Organization < ApplicationRecord
  acts_as_commontable dependent: :destroy
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :events, dependent: :destroy
end
