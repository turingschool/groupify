require "groupify/version"
require "groupify/group"
require "groupify/project"
require "groupify/teammates"
require "groupify/cohort"
require "groupify/schedule"
require "groupify/discuss"

module Groupify
  GSchool0 = Cohort.from_yml(File.absolute_path('../data/gschool0.yml', __FILE__))
  GSchool1 = Cohort.from_yml(File.absolute_path('../data/gschool1.yml', __FILE__))

  def self.current
    GSchool1
  end

  def self.teams_of(n)
    teams = current.teams_of(n).map do |names|
      names.join(', ')
    end
    md(teams)
  end

  def self.one_on_ones(n, start_time, duration)
    schedules = current.groups(n).map do |group|
      Schedule.new(group, start_time, duration).appointments
    end
    md(schedules)
  end

  def self.md(list)
    if list.first.is_a?(Array)
      list.map do |sub_list|
        to_markdown(sub_list)
      end.join("\n")
    else
      to_markdown(list)
    end
  end

  def self.to_markdown(list)
    s = ""
    list.each do |name|
      s << "* #{name}\n"
    end
    s
  end

  def self.discuss
    Groupify::Discuss.new(current.all)
  end
end
