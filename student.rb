require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom, :type, :name

  def initialize(age, name, parent_permission, type = 'Student', classroom: nil)
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
    @type = type
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_to_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.animals.include?(self)
  end
end
