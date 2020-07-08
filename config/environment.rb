require 'bundler/setup'
Bundler.require
require 'pry'
require 'tty-prompt'

require_relative '.env'
require_all 'lib'