# frozen_string_literal: true

# alcohol class
class Alcohol < ActiveRecord::Base
  has_many :beverage_alcohols
  has_many :beverages, through: :beverage_alcohols

  validates :kind, presence: true, uniqueness: { case_sensitive: false }
end
