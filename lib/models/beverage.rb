# frozen_string_literal: true

# beverage class
class Beverage < ActiveRecord::Base
  belongs_to :user

  has_many :beverage_alcohols
  has_many :alcohols, through: :beverage_alcohols

  validates :name, presence: true

  def self.choices
    Beverage.all.reduce([]) do |choices, beverage|
      choices << { name: beverage.name, value: beverage }
    end
  end
end
