module GSchool
  class Discuss
    attr_reader :students
    def initialize(students)
      @students = students.shuffle
    end

    def next
      students.pop
    end
  end
end
