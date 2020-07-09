class Beverage < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  def self.choices
    Beverage.all.reduce([]) do |choices, beverage|
      choices << { name: beverage.name, value: beverage }
    end
  end
end