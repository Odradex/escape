class Organization < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :events, dependent: :destroy
end
