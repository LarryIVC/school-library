class Classroom
  attr_accessor :label

  initialize(label)
  @label = label
  @students = []

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
