require_relative 'config/environment'

app = Cli.new

binding.pry

app.welcome

app.sign_up_or_sign_in

app.display_beverages
