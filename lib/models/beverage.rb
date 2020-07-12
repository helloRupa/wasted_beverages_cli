# frozen_string_literal: true

# beverage class
class Beverage < ActiveRecord::Base
  belongs_to :user

  has_many :beverage_alcohols
  has_many :alcohols, through: :beverage_alcohols

  validates :name, presence: true

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
