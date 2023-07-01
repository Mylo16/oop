require_relative './app'

class Options
  def initialize
    @app = App.new(self)
    show_options
  end

  def show_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    selector = gets.chomp
    choice(selector)
  end

  def choice(selector)
    options = {
      '1' => :list_books,
      '2' => :list_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_rentals,
      '7' => :exit
    }

    method = options[selector]
    if method.nil?
      puts 'Invalid option, please try again!'
      puts
      show_options
    else
      @app.send(method)
    end
  end
end

def main
  Options.new
end

main
