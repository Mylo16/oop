require './person'

class Teacher < Person
  attr_accessor :type, :name

  def initialize(age, specialization, name = 'Unknown', type = 'Teacher')
    super(age, name)
    @specialization = specialization
    @type = type
  end

  def can_use_services
    true
  end
end
