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

  def setup
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

  def prompt_multi_select(prompt, choices)
    @prompt.multi_select(prompt, choices, min: 1, per_page: 5, filter: true)
  end

  def welcome
    spinner("Let's get wasted!", 2)
  end

  def sign_up_or_log_in
    is_new_user = @prompt.yes?('First timer?')
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

  def select_alcohols
    @alcohols = prompt_multi_select(
      'Choose your favorite alcohol(s)',
      Alcohol.choices
    )
  end

  def select_beverage
    selected_beverage = prompt_select(
      'Select 1 to see more',
      Beverage.choices(Beverage.contains(@alcohols))
    )
    display_beverage(selected_beverage)

    binding.pry
  end

  def display_beverage(beverage)
    beverage.alcohols.each.with_index(1) do |alcohol, index|
      puts "#{index}) #{alcohol.kind.yellow}"
    end
  end

  def display_beverages
    @prompt.say('Craft your beverage', color: :cyan)
    new_beverage_info = prompt_collect_new_beverage_info
    new_beverage_info['user'] = @user
    new_beverage = Beverage.create(new_beverage_info)
    # beverage = @prompt.select('Pick your poison', filter: true) do |menu|
    #   menu.choices Beverage.choices
    #   menu.per_page 10
    # end
    binding.pry
  end

  def prompt_collect_new_beverage_info
    @prompt.collect do
      key(:name).ask('Name?', required: true)
      key(:strength).ask(
        'Strength 1-5?',
        required: true,
        convert: :int
      ) { |q| q.in('1-5') }
    end
  end

  # before(instance_methods(false))
  before(
    %i[
      welcome
      sign_up_or_log_in
      display_beverages
    ]
  )
end
