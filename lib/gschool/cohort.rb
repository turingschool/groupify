require 'yaml'
module GSchool
  class Cohort
    include Group

    def self.from_yml(filename)
      data = YAML.load(File.read(filename))
      cohort = new(data['names'], data['usernames'], data['left'])

      (data['projects'] || []).each do |project|
        cohort.projects << Project.new(project)
      end
      cohort
    end

    attr_reader :students, :usernames, :left
    attr_accessor :projects
    def initialize(students, usernames=[], left=[])
      @students = normalize(students)
      @left = normalize(left)
      @usernames = normalize(usernames)
      @projects = []
    end

    def all
      @all ||= (students - left)
    end

    def teams
      @teams ||= projects.inject([]) do |groups, project|
        groups.concat project.teams
      end
    end

    def teammates(name)
      @teammates ||= compute_teammates
      @teammates[name.intern].all
    end

    private

    def compute_teammates
      collaborators = Hash.new {|mates, name| mates[name] = Teammates.new(name)}
      teams.each do |names|
        names.each do |name|
          collaborators[name] << names
        end
      end
      collaborators
    end

    def normalize(list)
      (list || []).sort_by {|entry| entry.downcase }.map(&:intern)
    end
  end
end
