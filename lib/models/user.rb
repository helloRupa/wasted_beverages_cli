class User < ActiveRecord::Base
  has_many :beverages

  validates :username, presence: true, uniqueness: true
end