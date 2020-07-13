# frozen_string_literal: true

# alcohol class
class Alcohol < ActiveRecord::Base
  has_many :beverage_alcohols
  has_many :beverages, through: :beverage_alcohols

  validates :kind, presence: true, uniqueness: { case_sensitive: false }

  def self.choices(alcohols = Alcohol.all)
    alcohols_by_kind = alcohols.order(:kind)
    choices = alcohols_by_kind.reduce([]) do |options, alcohol|
      options << { name: alcohol.kind, value: alcohol }
    end
    choices << [{ name: 'Select all', value: alcohols_by_kind }]
  end
end
