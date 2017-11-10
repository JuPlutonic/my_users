# frozen_string_literal: true

class User < ApplicationRecord
  has_one :profile
    #validates :email, uniqueness: true
end
