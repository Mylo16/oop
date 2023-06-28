require './nameable'

class BaseDecorator < Nameable
  def initialize(component)
    super()
    @nameable = component
  end

  def correct_name
    @nameable.operation
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.strip if @nameable.correct_name.length > 10
  end
end
