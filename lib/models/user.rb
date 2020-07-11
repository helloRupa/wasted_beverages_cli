# frozen_string_literal: true

# user class
class User < ActiveRecord::Base
  has_many :beverages

  validates :username, presence: true, uniqueness: true

  def self.log_in_guest
    User.find_or_create_by(username: 'Guest')
  end

  def self.make(username)
    user = User.create(username: username)
    error = user.errors.full_messages.first
    print error ? error.red : ''
    user unless error
  end

  def self.choices
    User.all.reduce([]) do |choices, user|
      choices << { name: user.username, value: user }
    end
  end
end
