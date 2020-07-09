class App

  def self.banner
    banner = TTY::Box.frame(
      width: TTY::Screen.width,
      height: 12,
      align: :center,
      title: {
        top_left: '❤️ 🥂',
        bottom_right: '❤️ 🍻'
      },
      border: {
        type: :thick,
        top_left: :divider_down,
        top_right: :divider_down,
        bottom_left: :divider_up,
        bottom_right: :divider_up
      },
      style: {
        fg: :black,
        bg: :white,
        border: {
          fg: :black,
          bg: :white
        }
      }
    ) do
    "
     _    _           _           _  ______                                          
    | |  | |         | |         | | | ___ \\                                         
    | |  | | __ _ ___| |_ ___  __| | | |_/ / _____   _____ _ __ __ _  __ _  ___  ___ 
    | |/\\| |/ _` / __| __/ _ \\/ _` | | ___ \\/ _ \\ \\ / / _ \\ '__/ _` |/ _` |/ _ \\/ __|
    \\  /\\  / (_| \\__ \\ ||  __/ (_| | | |_/ /  __/\\ V /  __/ | | (_| | (_| |  __/\\__ \\
     \\/  \\/ \\__,_|___/\\__\\___|\\__,_| \\____/ \\___| \\_/ \\___|_|  \\__,_|\\__, |\\___||___/
                                                                      __/ |          
                                                                     |___/           
    "end

    system 'clear'
    print "#{banner}\n"
  end

end
