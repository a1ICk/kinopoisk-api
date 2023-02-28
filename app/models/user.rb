class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  validates :email, presence: true
  validates :password, presence: true

  scope :user_scope, ->(type, search) { where(type.to_sym => search) }
  scope :multi_value_user_scope, ->(type, search) { where(type.to_sym => search) }
end
