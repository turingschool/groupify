require 'yaml'
module GSchool
  class Cohort
    include Group

    def self.from_yml(filename)
      data = YAML.load(File.read(filename))
      new(data['names'], data['usernames'], data['left'])
    end

    attr_reader :students, :usernames, :left
    def initialize(students, usernames=[], left=[])
      @students = normalize(students)
      @left = normalize(left)
      @usernames = normalize(usernames)
    end

    def all
      @all ||= (students - left)
    end

    private

    def normalize(list)
      (list || []).sort_by {|entry| entry.downcase }.map(&:intern)
    end
  end
end
