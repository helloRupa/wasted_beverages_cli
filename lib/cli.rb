# frozen_string_literal: true

require_relative './modules/hooks'

# Cli class to hold app logic
class Cli
  extend Hooks

  $user = nil

  $prompt = TTY::Prompt.new(
    symbols: { marker: '🍾' },
    active_color: :cyan
  )

  frames = ['🥂🍾🥂🍾', '🍻🍺🍻🍺', '🍸🥃🍸🥃', '🍷🍹🍶🍹🍷']
  $spinner = TTY::Spinner.new(
    ':spinner :title',
    interval: 4,
    frames: frames,
    success_mark: '🍾'
  )

  $bar = TTY::ProgressBar.new(
    ':title ... :bar',
    total: 20,
    width: 20,
    complete: '🥂',
    head: '🍾',
    clear: true
  )

  def spinner(title, seconds)
    $spinner.reset
    $spinner.update(title: title)
    $spinner.auto_spin
    sleep(seconds)
    $spinner.success('🥂🍾🥂🍾')
    sleep(1)
  end

  def progress_bar(title)
    $bar.reset
    20.times do
      sleep(0.1)
      $bar.advance(1, title: title)
    end
  end

  def welcome
    spinner("Let's get wasted!", 2)
  end

  def sign_up_or_log_in
    is_new_user = $prompt.yes?('First timer?')
    is_new_user ? sign_up : log_in
    progress_bar('Pouring')
  end

  def sign_up
    username = $prompt.ask('Enter your username?', default: 'Guest') do |q|
      q.modify :strip
    end
    $user = username == 'Guest' ? User.log_in_guest : User.make(username)
  end

  def log_in
    $user = $prompt.select('Select yourself', filter: true) do |menu|
      menu.choices User.choices
      menu.per_page 5
    end
  end

  def display_beverages
    $prompt.say('Craft your beverage', color: :cyan)
    new_beverage_info = prompt_collect_new_beverage_info
    new_beverage_info['user'] = $user
    new_beverage = Beverage.create(new_beverage_info)
    # beverage = $prompt.select('Pick your poison', filter: true) do |menu|
    #   menu.choices Beverage.choices
    #   menu.per_page 10
    # end
    binding.pry
  end

  def prompt_collect_new_beverage_info
    $prompt.collect do
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
