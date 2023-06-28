class Person
  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age
    @age >= 18
  end
end
