# frozen_string_literal: true

require_relative 'config/environment'

app = Cli.new

binding.pry

app.setup
app.welcome
app.sign_up_or_log_in
app.select_alcohols
app.select_beverage
