class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, on: :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { customer: 0, manager: 1, admin: 2 }
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :customer
  end
end
