# frozen_string_literal: true

require_relative 'config/environment'

app = Cli.new

app.welcome
app.sign_up_or_log_in
app.main_menu
