require './book'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @persons = []
    @books = []
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name)
    @persons.push(teacher)
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @persons.push(student)
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(date, book, person)
    @persons.each do |p|
      @books.each do |b|
        next unless @persons.find_index(p) == person && @books.find_index(b) == book

        rental = Rental.new(date, b, p)
        p.add_rental(rental)
        b.add_rental(rental)
        puts 'book'
      end
    end
  end

  def list_books
    @books.each do |book|
      puts "#{@books.find_index(book)}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @persons.each do |person|
      puts "#{@persons.find_index(person)}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals(id)
    @persons.each do |p|
      p.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\", by: #{rental.book.author}" if p.id == id
      end
    end
  end
end
