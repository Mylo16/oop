require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_to_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.animals.include?(self)
  end
end
