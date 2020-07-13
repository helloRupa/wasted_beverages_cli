# frozen_string_literal: true

# beverage class
class Beverage < ActiveRecord::Base
  has_many :user_beverages
  has_many :users, through: :user_beverages

  has_many :beverage_alcohols
  has_many :alcohols, through: :beverage_alcohols

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :contains, (lambda do |alcohols|
    distinct
      .joins(:beverage_alcohols)
      .where(beverage_alcohols: { alcohol: alcohols })
      .order(:name)
  end)

  def self.choices(beverages = Beverage.all)
    beverages.reduce([]) do |choices, beverage|
      choices << { name: beverage.name, value: beverage }
    end
  end
end
