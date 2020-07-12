# frozen_string_literal: true

# user class
class User < ActiveRecord::Base
  has_many :beverages

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def self.log_in_guest
    User.find_or_create_by(username: 'Guest')
  end

  def self.make(username)
    user = User.create(username: username)
    error = user.errors.full_messages.first
    error ? { error: error } : user
  end

  def self.choices(users = User.all)
    users.reduce([]) do |choices, user|
      choices << { name: user.username, value: user }
    end
  end
end
