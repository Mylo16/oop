class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def add_to_book=(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def add_to_person=(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end
end
