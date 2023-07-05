require './nameable'

class Decorator < Nameable
  attr_accessor :component

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end
