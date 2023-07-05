# Implement a method called correct_name that will raise a NotImplementedError.

class Nameable
  def correct_name
    raise NotImplementedError, 'Implement this method in a child class'
  end
end
