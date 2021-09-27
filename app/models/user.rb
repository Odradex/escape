class User < ApplicationRecord
  validates :name, presence: true, on: :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
