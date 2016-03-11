class School
  def initialize
    @students = []
  end

  def add(name, grade)
    @students << Student.new(name, grade)
  end

  def to_h
    hash = {}

    @students
      .collect(&:grade)
      .uniq
      .sort
      .each do |grade|
        hash[grade] = []
      end

    @students
      .sort_by(&:name)
      .each do |student|
        hash[student.grade] << student.name
      end

    hash
  end

  def grade(grade)
    to_h.fetch(grade) { [] }
  end
end

class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end
end
