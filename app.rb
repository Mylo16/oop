require './book'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize(main)
    @main = main
    @persons = []
    @books = []
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
      create_teacher(age, name, specialization)
    elsif type == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.capitalize
      create_student(age, name, true) if parent_permission == 'Y'
      create_student(age, name, false) if parent_permission == 'N'
    end
    puts 'Person created successfully!'
    @main.show_options
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name)
    @persons.push(teacher)
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @persons.push(student)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    @main.show_options
  end

  def create_rental
    puts 'Select a book from the following list by number'
    choose_book
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    choose_person
    person = gets.chomp.to_i
    print 'Enter date (yyy/mm/dd): '
    date = gets.chomp
    @persons.each do |p|
      @books.each do |b|
        next unless @persons.find_index(p) == person && @books.find_index(b) == book

        rental = Rental.new(date, b, p)
        p.add_rental(rental)
        b.add_rental(rental)
      end
    end
    puts 'Rental created successfully'
    @main.show_options
  end

  def choose_book
    @books.each do |book|
      puts "#{@books.find_index(book)}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def choose_person
    @persons.each do |person|
      puts "#{@persons.find_index(person)}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_books
    @books.each do |book|
      puts "#{@books.find_index(book)}) Title: #{book.title}, Author: #{book.author}"
    end
    @main.show_options
  end

  def list_people
    @persons.each do |person|
      puts "#{@persons.find_index(person)}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    @main.show_options
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @persons.each do |p|
      p.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\", by: #{rental.book.author}" if p.id == id
      end
    end
    @main.show_options
  end
end
