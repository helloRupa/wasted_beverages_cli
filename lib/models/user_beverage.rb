# frozen_string_literal: true

# joiner class for users and beverages
class UserBeverage < ActiveRecord::Base
  belongs_to :user
  belongs_to :beverage

  validates :user, uniqueness: { scope: :beverage, message: 'You already have this beverage' }
end
