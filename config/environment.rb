# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

require 'pry'

require 'colorize'
require 'colorized_string'
require 'tty-box'
require 'tty-prompt'
require 'tty-progressbar'
require 'tty-spinner'
require 'tty-table'

require_all 'lib'

# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
# ActiveRecord::Base.logger = old_logger
# ActiveRecord::Base.logger = Logger.new(STDOUT)
