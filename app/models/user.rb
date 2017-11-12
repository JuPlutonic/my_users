# frozen_string_literal: true

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  # try remember_created_at not created_at
  scope :admins, -> { where(admin: true) }
end
