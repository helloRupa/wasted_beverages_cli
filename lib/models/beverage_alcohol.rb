# frozen_string_literal: true

# joiner class for beverages and alcohol
class BeverageAlcohol < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :alcohol
end
