class Cli

  $user = ""
  $my_api_key = process.env.MY_API_KEY

  def welcome
    puts "Hello welcome to Wasted Beverages!"
  end

  def sign_up_or_sign_in
    $user = gets.strip
    puts "Hi #{user}"
  end

  def display_beverages
    $user.beverages.each do |beverage|
      puts "#{beverage.name} #{beverage.price}\n"
    end
  end

  def api_request
    binding.pry

    RESTClient.get("https://wherever?#{$my_api_key}")
  end

end