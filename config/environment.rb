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

ActiveRecord::Base.logger = nil
