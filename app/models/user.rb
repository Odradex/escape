class User < ApplicationRecord
  validates :name, presence: true, on: :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: [:user, :manager, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :student
  end

end
