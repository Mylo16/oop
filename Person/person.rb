require './nameable'
require './decorators'
require './classroom'
require './book'
require './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end
end
