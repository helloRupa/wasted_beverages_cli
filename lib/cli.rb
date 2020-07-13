# frozen_string_literal: true

require_relative './modules/hooks'

# Cli class to hold app logic
class Cli
  extend Hooks

  def tty_prompt
    # help_color = Pastel.new.italic.bright_yellow.detach
    TTY::Prompt.new(
      symbols: { marker: '🍾' },
      active_color: :cyan,
      help_color: :bright_cyan
    )
  end

  def tty_spinner
    frames = ['🥂🍾🥂🍾', '🍻🍺🍻🍺', '🍸🥃🍸🥃', '🍷🍹🍶🍹🍷']
    TTY::Spinner.new(
      ':spinner :title',
      interval: 4,
      frames: frames,
      success_mark: '🍾'
    )
  end

  def tty_progressbar
    TTY::ProgressBar.new(
      ':title ... :bar',
      total: 20,
      width: 20,
      complete: '🥂',
      head: '🍾',
      clear: true
    )
  end

  def initialize
    @user = nil
    @prompt = tty_prompt
    @spinner = tty_spinner
    @bar = tty_progressbar
  end

  def spinner(title, seconds)
    @spinner.reset
    @spinner.update(title: title)
    @spinner.auto_spin
    sleep(seconds)
    @spinner.success('🥂🍾🥂🍾')
    sleep(1)
  end

  def progress_bar(title)
    @bar.reset
    20.times do
      sleep(0.1)
      @bar.advance(1, title: title)
    end
  end

  def prompt_ask(prompt, options = {})
    @prompt.ask(prompt, options) { |q| q.modify :strip }
  end

  def prompt_select(prompt, choices)
    @prompt.select(prompt, choices, per_page: 5, filter: true)
  end

  def prompt_select_yes?(prompt)
    prompt_select(prompt, yes: true, no: false)
  end

  def prompt_multi_select(prompt, choices)
    @prompt.multi_select(prompt, choices, min: 1, per_page: 5, filter: true)
  end

  def welcome
    spinner("Let's get wasted!", 2)
  end

  def sign_up_or_log_in
    is_new_user = prompt_select_yes?('First timer?')
    is_new_user ? sign_up : log_in
    progress_bar('Pouring')
  end

  def sign_up
    loop do
      username = prompt_ask('Enter your username?', default: 'Guest')
      @user = username == 'Guest' ? User.log_in_guest : User.make(username)
      break if @user.is_a?(User) || puts(@user[:error].red)
    end
  end

  def log_in
    @user = prompt_select('Select yourself', User.choices)
  end

  def main_menu
    loop do
      value = prompt_select('What would you like to do?', menu_options)
      break if value == 'exit'
    end
  end

  def menu_options
    {
      # "select alcohols": method(:select_alcohols).(),
      "select alcohols": -> { select_alcohols },
      "select beverage": -> { select_beverage },
      "craft beverage": -> { craft_beverage },
      "exit": -> { exit_app }
    }
  end

  def select_alcohols
    @alcohols = prompt_multi_select(
      'Choose your favorite alcohol(s)',
      Alcohol.choices
    ).flatten.uniq
  end

  def select_beverage
    @alcohols ? display_alcohols : no_alcohols_selected
    @selected_beverage = prompt_select(
      'Select 1 to see more',
      Beverage.choices(Beverage.contains(@alcohols || Alcohol.all))
    )
    display_beverage
    is_add = prompt_select_yes?('Add to collection?')
    add_to_collection if is_add
  end

  def display_alcohols
    alcohols = @alcohols.map(&:kind)
    list = "#{alcohols[0...-1].join(', ')}, or #{alcohols.last}"
    puts "Showing beverages containing #{list.light_cyan}"
  end

  def no_alcohols_selected
    puts 'No alcohols selected, showing all beverages'.cyan
  end

  def display_beverage
    @selected_beverage.alcohols.each.with_index(1) do |alcohol, index|
      puts "#{index}) #{alcohol.kind.yellow}"
    end
  end

  def add_to_collection
    result = @user.add_to_collection(@selected_beverage)
    puts result[:message] ? result[:message].green : result[:error].red
    is_select_another = prompt_select_yes?('Add another?')
    select_beverage if is_select_another
  end

  def craft_beverage
    @prompt.say('Craft your beverage', color: :cyan)
    new_beverage_info = prompt_collect_new_beverage_info
    new_beverage_info[:users] = [@user]
    new_beverage = Beverage.create(new_beverage_info)
    display_success_or_error(new_beverage)
  end

  def display_success_or_error(new_beverage)
    success_message = 'successfully crafted and added to your collection'
    success = "#{new_beverage.name} #{success_message}"
    error = new_beverage.errors.full_messages.first
    puts error ? error.red : success.cyan
  end

  def prompt_collect_new_beverage_info
    @prompt.collect do
      key(:name).ask('Name?', required: true)
      key(:strength).ask(
        'Strength 1-5?', required: true, convert: :int
      ) { |q| q.in('1-5') }
      key(:alcohols).multi_select(
        'Choose the poison(s)', Alcohol.choices,
        min: 1, per_page: 5, filter: true
      )
    end
  end

  def exit_app
    App.exit
    puts 'Go drunk you\'re home!'.cyan
    'exit'
  end

  # before(instance_methods(false))
  before(
    %i[
      welcome
      sign_up_or_log_in
      main_menu
      select_alcohols
      select_beverage
      craft_beverage
    ]
  )
end
