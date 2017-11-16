# frozen_string_literal: true

# Include default devise modules. Others available are:
# ::lockable and :omniauthable
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :profile, dependent: :destroy
  validates :name, presense: true
  validates :email, uniqueness: true, presence: true
  validates :avatar_file, presence: true

  scope :admins, -> { where(admin: true) }
  scope :other_admins, -> (cur_user){ where(admin: true) && where(cur_user!=id) }
  scope :newbies, -> { where created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day }
  scope :reverse_order, ->(order) { order(created_at: order) }

  def owner_of?(object)
    id == object.user_id
  end
end
