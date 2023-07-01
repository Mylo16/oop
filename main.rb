require './app'

class Options
  def initialize
    @app = App.new
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
    selector = gets.chomp.to_i
    if selector == 1
      @app.list_books
      show_options
    elsif selector == 2
      @app.list_people
      show_options
    else
      choice(selector)
    end
  end

  def choice(selector)
    case selector
    when 3
      create_person
    when 4
      creating_book
    when 5
      creating_rental
    when 6
      listing_rentals
    when 7
      puts 'Exited'
    end
  end

  def create_person
    print 'Select [0] to create teacher or [1] to create student: '
    type = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    if type.zero?
      print 'Specialization: '
      specialization = gets.chomp
      @app.create_teacher(age, name, specialization)
    elsif type == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.capitalize
      @app.create_student(age, name, true) if parent_permission == 'Y'
      @app.create_student(age, name, false) if parent_permission == 'N'
    end
    puts 'Person created successfully!'
    show_options
  end

  def creating_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
    puts 'Book created successfully'
    show_options
  end

  def listing_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @app.list_rentals(id)
    show_options
  end

  def creating_rental
    puts 'Select a book from the following list by number'
    @app.list_books
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @app.list_people
    person = gets.chomp.to_i
    print 'Enter date (yyy/mm/dd): '
    date = gets.chomp
    @app.create_rental(date, book, person)
    puts 'Rental created successfully'
    show_options
  end
end

def main
  Options.new
end

main
